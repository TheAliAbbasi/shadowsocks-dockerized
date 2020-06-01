
# Shadowsocks dockerized
This repository contains a pre-setup shadowsocks using docker
## Setup guide
 1. Install docker on any server ([how to install docker](https://docs.docker.com/get-docker/))
 2. clone repo on your server
 3. Edit `config.json` and put a strong password.
 4. Run this command inside the repo folder `docker-compose up -d`
 5. Install one of these clients based on your OS
 - Android: [https://play.google.com/store/apps/details?id=com.github.shadowsocks](https://play.google.com/store/apps/details?id=com.github.shadowsocks)
 - Windows: [https://github.com/shadowsocks/shadowsocks-windows/releases/download/4.1.10.0/Shadowsocks-4.1.10.0.zip](https://github.com/shadowsocks/shadowsocks-windows/releases/download/4.1.10.0/Shadowsocks-4.1.10.0.zip) (requires .Net framework)
 - Mac OS: [https://apps.apple.com/app/outline-app/id1356178125](https://apps.apple.com/app/outline-app/id1356178125) 
 - Linux: [https://github.com/shadowsocks/shadowsocks-qt5/wiki/Installation](https://github.com/shadowsocks/shadowsocks-qt5/wiki/Installation) OR [https://github.com/Jigsaw-Code/outline-client/](https://github.com/Jigsaw-Code/outline-client/)
 - IOS: [https://apps.apple.com/app/outline-app/id1356177741](https://apps.apple.com/app/outline-app/id1356177741)

Setup your client according to data in `config.json`
Have fun and stay safe
