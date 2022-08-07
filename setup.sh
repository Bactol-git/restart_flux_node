#! /bin/bash
sed "s@replacethis@$(pwd)@" restartnode.service.temp > restartnode.service

sudo mv restartnode.service /etc/systemd/system
FILE=/etc/systemd/system/restartnode.service
if test -f "$FILE"; then
    echo "Startup service created"
fi

echo 'Starting service'
sudo systemctl daemon-reload
sudo systemctl enable restartnode.service
sudo systemctl start restartnode.service

echo 'Done'
