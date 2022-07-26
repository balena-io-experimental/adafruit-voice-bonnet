#!/usr/bin/env bash

modules=$(lsmod)

if grep -q i2c_dev <<< "$modules" && \
	grep -q snd_soc_wm8960 <<< "$modules" && \
	grep -q snd_soc_ac108 <<< "$modules" && \
	grep -q snd_soc_seeed_voicecard <<< "$modules"
then
    # All modules loaded so starting the application
    alsactl restore &> /dev/null
    echo "Ready"
    exec tail -f /dev/null
else
    # Not all modules loaded so loading them and restarting the container
    echo "Required modules are not yet installed. Going to install them and restart the container."
    insmod modules/snd-soc-seeed-voicecard.ko
	insmod modules/snd-soc-ac108.ko
	insmod modules/snd-soc-wm8960.ko
	modprobe i2c-dev
    # Exiting 1 so that restart is triggered on restart-on-failure policy
    exit 1
fi
