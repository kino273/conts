#!/bin/sh
service cron start &
/usr/sbin/sshd -D
