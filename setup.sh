#! /usr/bin/env sh

#Set a random string password
password=$(pwgen -n 20 -1)
sed -i 's/""/"'$password'"/g' /conf/config.json

method=$(jq -r ". .method" /conf/config.json)
password=$(jq -r ". .password" /conf/config.json)
server_port=$(jq -r ". .server_port" /conf/config.json)

connection_string="${method}:${password}@${SERVER_IP}:${server_port}"
connection_string=$(echo $connection_string | openssl enc -a -A | tr /+ _- | tr -d =)
connection_string='ss://'${connection_string%?}'#shadowsocks'

echo 'connection string is: '$connection_string

qrencode -t ANSIUTF8 $connection_string

ss-server -c /conf/config.json