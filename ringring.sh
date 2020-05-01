#!/bin/bash
set -o nounset
set -o errexit

# Export like this
#export SLACK_WEBHOOK=https://hooks.slack.com/services/XXXXXXXXXX

slack_msg="Ring Ring! Someone is at the door!"

if [ "${SLACK_WEBHOOK:-}" ]; then
	curl -X POST -H 'Content-type: application/json' \
		--data "{\"text\":\"$slack_msg\"}" $SLACK_WEBHOOK
fi
