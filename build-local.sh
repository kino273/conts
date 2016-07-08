#!/bin/sh

ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime

dnf install -y --nogpgcheck \
    http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \

dnf install -y \
    sudo passwd openssh-server openssh-clients \
    tar screen crontabs strace telnet perl libpcap bc patch \
    initscripts make man \
    emacs wget gcc ncurses-devel \
    git dnf-plugins-core gpg \
    ImageMagick ffmpeg \
    ipa-gothic-fonts ipa-mincho-fonts ipa-pgothic-fonts ipa-pmincho-fonts ipa-ex-gothic-fonts ipa-ex-mincho-fonts \
    python-pip python3-pip

cd /home/worker; su worker -c "wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf -"
