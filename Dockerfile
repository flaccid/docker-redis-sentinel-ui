FROM node:alpine

ENV REDIS_MASTER_NAME=mymaster
ENV SENTINEL_HOST=sentinel
ENV SENTINEL_PORT=26379
ENV DEBUG=false

COPY redis-sentinel-ui /usr/src/app
COPY entry.sh /usr/src/app/entry.sh

WORKDIR /usr/src/app

RUN npm install && \
    npm install -g gulp && \
    gulp default && \
    node init.js

COPY config.js.tpl /usr/src/app/config.js

EXPOSE 8080

CMD ["./entry.sh"]
