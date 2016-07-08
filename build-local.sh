#!/bin/sh

ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

echo deb http://www.deb-multimedia.org jessie main non-free >> /etc/apt/sources.list
echo deb-src http://www.deb-multimedia.org jessie main non-free  >> /etc/apt/sources.list

apt-get update
apt-get install -y --force-yes deb-multimedia-keyring ffmpeg
apt-get install -y apt-utils
apt-get install -y --fix-missing \
        apt-file openssh-server sudo screen vim emacs less cron git \
        curl wget make gcc ncurses-dev \
        python-pip python-dev python3-dev python3-pip


cd /usr/local; su worker -c "wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -"
