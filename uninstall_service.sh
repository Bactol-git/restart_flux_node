#! /bin/bash
systemctl --user stop restartnode.service

sudo rm /etc/systemd/user/restartnode.service
systemctl --user daemon-reload

sudo rm /etc/sudoers.d/restartnode_include_file

FILE=/etc/sudoers.d/restartnode_include_file
if test -f "$FILE"; then
    echo "Something went wrong"
fi
