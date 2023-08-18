FROM debian:latest

ENV PORT=443
ENV ID=d42e30bc-f02c-40c1-92b9-883739bf0dcf
ENV PATH=/wspath

WORKDIR /xray

RUN echo "export PORT=$PORT" >> ./env.sh
RUN echo "export ID=$ID" >> ./env.sh
RUN echo "export PATH=$PATH" >> ./env.sh

COPY start.sh .

ENTRYPOINT ["/xray/start.sh"]