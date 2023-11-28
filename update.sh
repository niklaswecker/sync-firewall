apt update
cd /etc/sync-firewall
rm blocklist.txt
wget https://raw.githubusercontent.com/niklaswecker/sync-firewall/main/blocklist.txt
sleep 1
cd skripte
./sync-blocklist-with-pve-firewall.sh
