#! /bin/bash
sed "s@replacethis@$(pwd)@" restartnode.service.temp > restartnode.service

sudo mv restartnode.service /etc/systemd/user
FILE=/etc/systemd/user/restartnode.service
if test -f "$FILE"; then
    echo "Startup service created"
fi

user=$(who -q| sed -n 1p | cut -f 1 -d " ")
add_permission_kill='"ALL=(ALL) NOPASSWD: /bin/kill"'

sudo bash -c "echo $user $add_permission_kill >> /etc/sudoers.d/restartnode_include_file"

FILE=/etc/sudoers.d/restartnode_include_file
if test -f "$FILE"; then
    echo "Sudoers file created: Setup finished"
fi

echo 'Starting service'
systemctl --user daemon-reload
systemctl --user enable restartnode.service
systemctl --user start restartnode.service

echo 'Done'
