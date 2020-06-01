FROM mritd/shadowsocks

SHELL [ "/bin/sh", "-c" ]

RUN apk add --no-cache jq pwgen openssl libqrencode

COPY setup.sh /setup.sh
COPY config.json /conf/config.json

VOLUME [ "/conf" ]
SHELL [ "/bin/bash" ]

ENTRYPOINT [ "/setup.sh" ]
