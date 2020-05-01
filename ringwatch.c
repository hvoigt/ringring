#include <stdio.h>
#include <stdlib.h>
#include <pigpio.h>

#include <unistd.h>

#define RING_PIN 21

int iteration = 0;
pthread_mutex_t mutex;
pthread_cond_t cond;

struct time_t {
	int seconds;
	int micros;
} lastTime;

void ring_exit(int code)
{
	gpioTerminate();
	pthread_mutex_destroy(&mutex);
	pthread_cond_destroy(&cond);
	exit(code);
}

static void die(const char *err)
{
	fprintf(stderr, "%s\n", err);
	ring_exit(1);
}

void readTime(struct time_t *time)
{
	if (gpioTime(PI_TIME_RELATIVE, &time->seconds, &time->micros))
		die("Failed to read time");
}

int timeDiff(struct time_t bigger, struct time_t smaller)
{
	int sdiff = bigger.seconds - smaller.seconds;
	int mdiff = bigger.micros - smaller.micros;
	return (sdiff * 1000) + (mdiff / 1000);
}

void ringRing(int gpio, int level, uint32_t tick)
{
	if (level == PI_TIMEOUT)
		return;

	pthread_cond_broadcast(&cond);
}

void ringOff(int gpio, int level, uint32_t tick)
{
	if (level == PI_TIMEOUT)
		return;
}

void execute(char *const argv[])
{
	pid_t pid = fork();
	if (pid < 0)
		die("Failed to fork");
	else if (pid > 0)
		return;

	execv(argv[0], argv);
}

int main(int argc, char *const argv[])
{
	if (argc < 2)
		die("Usage: ringwatch <ring-command> [args ...]");

	pthread_cond_init(&cond, NULL);
	pthread_mutex_init(&mutex, NULL);

	printf("Hardware Revision: 0x%x\n", gpioHardwareRevision());

	if (gpioInitialise() < 0)
		die("Failed to initialize");

	readTime(&lastTime);

	if (gpioSetMode(RING_PIN, PI_INPUT))
		die("Failed to set RING_PIN to input");

	if (gpioSetPullUpDown(RING_PIN, PI_PUD_UP))
		die("Failed to set RING_PIN to pull up");

	if (gpioSetISRFunc(RING_PIN, FALLING_EDGE, 2000, ringRing))
		die("Failed to set ISR");

	pthread_mutex_lock(&mutex);
	while (1) {
		pthread_cond_wait(&cond, &mutex);
		struct time_t current;
		readTime(&current);
		if (timeDiff(current, lastTime) < 3000)
			continue;
		printf("%03i Ring ring!\n", ++iteration);
		execute(argv + 1);
		readTime(&lastTime);
	}

	ring_exit(0);
}
