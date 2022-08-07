#! /bin/bash
sudo systemctl stop restartnode.service

sudo rm /etc/systemd/system/restartnode.service
sudo systemctl daemon-reload

