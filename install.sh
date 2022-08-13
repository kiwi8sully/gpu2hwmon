#!/bin/bash

cp ./gpu2hwmon.conf /etc
cp ./gpu2hwmon.service /etc/systemd/system
cp ./gpu2hwmon /usr/bin
chmod +x ./uninstall.sh
chmod +x /usr/bin/gpu2hwmon
sleep 1
systemctl enable gpu2hwmon.service
sleep 1
systemctl start gpu2hwmon.service
exit 0