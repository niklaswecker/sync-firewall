apt update
cd
mkdir /etc/sync-firewall
cd /sync-firewall
wget https://raw.githubusercontent.com/niklaswecker/sync-firewall/main/blocklist.txt
sleep 1
mkdir skripte
cd skripte
wget  https://raw.githubusercontent.com/niklaswecker/sync-firewall/main/blocklist-update.sh
chmod +x blocklist-update.sh
sed -i '$ a *  /5 * * * * root /etc/sync-firewall/skripte/blocklist-update.sh >/dev/null 2>&1' /etc/crontab
sleep 1
wget  https://raw.githubusercontent.com/niklaswecker/sync-firewall/main/update.sh
chmod +x update.sh
sleep 1
wget  https://raw.githubusercontent.com/niklaswecker/sync-firewall/main/get-v4.sh
chmod +x get-v4.sh
./get-v4.sh
wget  https://raw.githubusercontent.com/niklaswecker/sync-firewall/main/get-v6.sh
chmod +x get-v6.sh
./get-v6.sh
cd
mv install.sh cd /etc/sync-firewall/skripte/install.sh
