#!/bin/bash

set -e

> /etc/upnp_speaker.conf
for VAR in `env`; do
    if [[ $VAR =~ ^MINIDLNA_ ]]; then
        upnp_speaker_name=`echo "$VAR" | sed -r "s/UPNP_SPEAKER_(.*)=.*/\1/g" | tr '[:upper:]' '[:lower:]'`
        upnp_speaker_value=`echo "$VAR" | sed -r "s/.*=(.*)/\1/g"`
        echo "${minidlna_name}=${upnp_speaker_value}" >> /etc/upnp_speaker.conf
    fi
done

[ -f /var/run/upnp_speaker/minidlna.pid ] && rm -f /var/run/upnp_speaker/upnp_speaker.pid

exec upnp_speaker -d $@
