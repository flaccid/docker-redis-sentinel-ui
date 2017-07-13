FROM node:alpine

COPY redis-sentinel-ui /usr/src/app

WORKDIR /usr/src/app

RUN npm install && \
    npm install -g gulp && \
    gulp default && \
    node init.js

EXPOSE 8080

CMD ["node", "app.js"]
