CFLAGS=-Wall -pthread
LDFLAGS=-lpigpio -lrt

ringwatch: ringwatch.c

clean:
	rm ringwatch
