#!/bin/bash

systemctl stop gpu2hwmon.service
sleep 1
systemctl disable gpu2hwmon.service
sleep 1
systemctl daemon-reload
systemctl reset-failed
rm /etc/gpu2hwmon.conf
rm /etc/systemd/system/gpu2hwmon.service
rm /usr/bin/gpu2hwmon

exit 0