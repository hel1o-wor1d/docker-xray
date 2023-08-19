FROM alpine:latest

WORKDIR /xray

ENV PORT=443
ENV ID=d42e30bc-f02c-40c1-92b9-883739bf0dcf
ENV WSPATH=/wspath

RUN cat > ./config.json <<EOF
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

ADD https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip /xray
RUN apk update
RUN apk add --no-cache unzip
RUN unzip ./Xray-linux-64.zip

ENTRYPOINT ["./xray", "-c", "./config.json"]
