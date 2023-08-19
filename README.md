# docker-xray
Deploy xray into docker. For personal usage.

Github: https://github.com/benjaminyin01/docker-xray  
Docker: https://hub.docker.com/r/iamybj/docker-xray


Environment variables:  
PORT : Listen port, default 443  
ID : vless ID, default d42e30bc-f02c-40c1-92b9-883739bf0dcf  
WSPATH: websocket path, default /wspath

config.json template:  
```
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
```

Tested in Azure container.
