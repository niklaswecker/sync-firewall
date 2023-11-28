apt update
apt install iptables -y
iptables -N WHITELIST
iptables -F WHITELIST
mkdir /etc/telsec
cd /etc/telsec
mkdir lists
cd lists
mkdir whitelists
cd whitelists
wget https://raw.githubusercontent.com/niklaswecker/telsec/main/whitelist.lst
for i in $(cat whitelist.lst); do iptables -A WHITELIST -s $i -j ACCEPT; done
iptables -I INPUT -j WHITELIST
sleep 2
iptables -N BLOCKLIST
iptables -F BLOCKLIST
mkdir /etc/telsec
cd /etc/telsec/lists
mkdir blocklists
cd blocklists
wget https://raw.githubusercontent.com/niklaswecker/telsec/main/blocklist.lst
for i in $(cat blocklist.lst); do iptables -A BLOCKLIST -s $i -j DROP; done
iptables -I INPUT -j BLOCKLIST
sleep 1
mkdir /etc/telsec/update
cd /etc/telsec/update
wget https://raw.githubusercontent.com/niklaswecker/telsec/main/update.sh
chmod +x update.sh
sleep 1
cd /etc/telsec
mkdir uninstall
cd uninstall
wget https://raw.githubusercontent.com/niklaswecker/telsec/main/uninstall.sh
chmod +x uninstall.sh
sleep 1
cd /etc/telsec/update
wget  https://raw.githubusercontent.com/niklaswecker/telsec/main/update-all.sh
chmod +x update-all.sh
sed -i '$ a *  /5 * * * * root /etc/telsec/update/update-all.sh >/dev/null 2>&1' /etc/crontab
mkdir /etc/telsec/install
cd 
mv install.sh /etc/telsec/install/install.sh
sed -i '$ a *  /5 * * * * root /etc/telsec/update/update.sh >/dev/null 2>&1' /etc/crontab
sleep 1
cd /etc/telsec
mkdir ip
cd ip
mkdir v4
mkdir v6 
cd /etc/telsec/ip/v4
wget  https://raw.githubusercontent.com/niklaswecker/telsec/main/get-v4.sh
chmod +x get-v4.sh
cd /etc/telsec/ip/v6
wget  https://raw.githubusercontent.com/niklaswecker/telsec/main/get-v6.sh
chmod +x get-v6.sh
cd /etc/telsec/ip/
wget https://raw.githubusercontent.com/niklaswecker/telsec/main/get-v4-v6.sh
chmod +x get-v4-v6.sh
sed -i '$ a *  /5 * * * * root /etc/telsec/ip/v4/get-v4.sh >/dev/null 2>&1' /etc/crontab
sed -i '$ a *  /5 * * * * root /etc/telsec/ip/v4/get-v6.sh >/dev/null 2>&1' /etc/crontab
