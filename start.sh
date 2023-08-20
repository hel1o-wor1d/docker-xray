#!/bin/sh

cd /xray

apk update
apk add --no-cache wget unzip
wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip ./Xray-linux-64.zip
rm ./Xray-linux-64.zip

if test -z "$CONFIG"
then
    PORT=${PORT:-443}
    ID=${ID:-"d42e30bc-f02c-40c1-92b9-883739bf0dcf"}
    WSPATH=${WSPATH:-"/index.html"}

    cat > ./config.json <<EOF
{
    "inbounds": [{
        "port": ${PORT},
        "protocol": "vless",
        "settings": {
            "clients": [{
                "id": "${ID}"
            }],
            "decryption":"none"
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "${WSPATH}"
            }
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF
else
    echo "$CONFIG" > ./config.json
fi

 ./xray -c ./config.json
