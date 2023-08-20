# docker-xray
Deploy xray into docker. For personal usage.

Github: https://github.com/benjaminyin01/docker-xray  
Docker: https://hub.docker.com/r/iamybj/docker-xray


##  Environment variables:  
If you want to completely custom a config file, just copy the content of the config file and set it to a variable:  
CONFIG : the content of the config file.    
For example:
```
{
    "inbounds": [{
        "port": 443,
        "protocol": "vless",
        "settings": {
            "clients": [{
                "id": "d42e30bc-f02c-40c1-92b9-883739bf0dcf"
            }],
            "decryption":"none"
        },
        "streamSettings": {
            "network": "quic",
            "quicSettings": {}
        }
    }],
    "outbounds": [{
        "protocol": "freedom"
    }]
}
```
If you want to use the vless+websocket solution, you can set 3 variables:  
PORT : Listen port, default 443  
ID : vless ID, default d42e30bc-f02c-40c1-92b9-883739bf0dcf  
WSPATH: websocket path, default /index.html

The config.json template:  
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
