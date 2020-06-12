FROM mritd/shadowsocks

ENV SS_CONFIG -c /conf/config.json
ENV SS_MODULE ss-server
ENV PATH $PATH:/root/.acme.sh

SHELL [ "/bin/sh", "-c" ]

RUN apk add --no-cache jq pwgen openssl libqrencode sed wget

# Install acme.sh
RUN wget https://get.acme.sh -O - -q | sh

COPY setup.sh /setup.sh
COPY config.json /conf/config.json

VOLUME [ "/conf" ]
SHELL [ "/bin/bash" ]

ENTRYPOINT [ "/setup.sh" ]
