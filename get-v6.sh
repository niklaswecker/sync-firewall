cd /etc/telsec/ip/v6
rm index.html
wget v6.scholz.tk
mv index.html v6.ip
sleep 1
echo Aktuelle IPv6 Addresse:
cat /etc/telsec/ip/v6/v6.ip
