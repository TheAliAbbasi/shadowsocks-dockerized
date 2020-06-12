#! /usr/bin/env sh

#Set a random string password
password=$(pwgen -n 20 -1)
sed -i 's/"<YOUR_PASSWORD>"/"'$password'"/g' /conf/config.json

method=$(jq -r ". .method" /conf/config.json)
password=$(jq -r ". .password" /conf/config.json)
server_port=$(jq -r ". .server_port" /conf/config.json)

connection_string="${method}:${password}@${SERVER_IP}:${server_port}"
connection_string=$(echo $connection_string | openssl enc -a -A | tr /+ _- | tr -d =)
connection_string='ss://'${connection_string%?}'#shadowsocks'

echo 'connection string is: '$connection_string

qrencode -t ANSIUTF8 $connection_string

# Issue tls certificate (if not exists)
if [ ! -f "/conf/ssl.pem" ]; then
    acme.sh --issue --dns dns_cf -d $DOMAIN --cert-file /conf/ssl.pem --key-file /conf/ssl.key --ca-file /conf/ssl.pem
fi

SS_CONFIG=$SS_CONFIG" --plugin v2ray-plugin --plugin-opts 'server;tls;host=$DOMAIN;cert=/conf/ssl.pem;key=/conf/ssl.key;mode:tcp_only;fast-open;localAddr=127.0.0.1;localPort=1080;remoteAddr=0.0.0.0;remotePort=443"

/entrypoint.sh
# ss-server -c /conf/config.json