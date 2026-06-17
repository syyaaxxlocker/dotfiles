#!/bin/bash

state=$(/usr/bin/cmus-remote -C status | grep status | cut -c 8-)
if [ "$state" = "paused" ]; then
	/usr/bin/cmus-remote -C player-play
else
	/usr/bin/cmus-remote -C player-pause
fi
