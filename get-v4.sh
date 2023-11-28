cd /etc/telsec/ip/v4
rm index.html
wget v4.scholz.tk
mv index.html v4.ip
sleep 1
echo Aktuelle IPv4 Adresse:
cat /etc/telsec/ip/v4/v4.ip
