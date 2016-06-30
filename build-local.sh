#!/bin/sh

ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

apt-get update
apt-get install -y apt-utils
apt-get install -y --fix-missing \
        apt-file openssh-server sudo screen vim emacs less cron git \
        curl wget make gcc ncurses-dev \
        python-pip python-dev python3-dev python3-pip
