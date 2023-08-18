#!/bin/sh

cd /xray
source ./env.sh

apt-get install wget unzip

wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip Xray-linux-64.zip

echo > ./config.json << EOF
{
    "inbounds": [{
        "port": $PORT,
        "protocol": "vless",
        "settings": {
            "clients": [{
                "id": "$ID"
            }],
            “decryption”:”none”
        },
        "streamSettings": {
            "network": "ws",
            "wsSettings": {
                "path": "$PATH"
            }
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
EOF

./xray -c ./config.json



