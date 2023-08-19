FROM alpine:latest

WORKDIR /xray

COPY start.sh .
RUN chmod +x ./start.sh

ENTRYPOINT ["./start.sh"]