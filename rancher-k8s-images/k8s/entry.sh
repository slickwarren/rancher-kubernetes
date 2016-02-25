#!/bin/bash

if [ "$1" == "kubelet" ]; then
    /usr/bin/share-mnt /var/lib/kubelet /var/lib/docker -- $0 --stage2 "$@"
elif [ "$1" == "--stage2" ]; then
    mount --rbind /host/sys /sys
    shift 1
    exec "$@"
else
    exec "$@"
fi
