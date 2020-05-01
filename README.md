# Ring Ring !

I needed my doorbell to post to slack, so I would not miss any
deliveries while using noise cancelling headphones.

## You need

* Raspberry Pi with Raspbian Lite
* GPIO "adapter board" for your doorbell
* Standard Doorbell

## Installation

1. Connect GPIO Pin 21 with the adapter board, so that it is pulled to
   GND when the doorbell rings
1. The script `install-pigpio.sh` can be used to install the needed
   libraries for Raspbian.
1. `make`
1. Configure a Slack webhook for the notification and set the
   `SLACK_WEBHOOK` variable to point to it.
1. `sudo ./ringwatch ./ringring.sh`

Now when connecting Pin 21 to GND a message should show up in you
Slack or wherever you want it. You can customize this and exchange
`./ringring.sh` with any command that executes the action you want.

To make `ringwatch` start on startup you can put it in `/etc/rc.local`
like so

````
export SLACK_WEBHOOK=https://hooks.slack.com/services/XXXXXX
/home/pi/ringring/ringwatch /home/pi/ringring/ringring.sh
````

## Advantages over other solutions

We use a hardware interrupt instead of busy waiting on the GPIO pin,
so we are immediately notified when the signal comes in, can not miss
a state change and do not unnecessarily heat the SoC with doing
nothing.

This also allows us to properly debounce the input in software. If you
need a longer time for that its quite easy to modify.
