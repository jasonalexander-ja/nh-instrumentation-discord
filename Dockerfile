FROM node:20-alpine

RUN apk add --no-cache openssl-dev openssl-libs-static fontconfig font-dejavu && \
    mkdir /nh-discord

COPY commands/ /nh-discord/commands/
COPY main.js /nh-discord/main.js
COPY charts.js /nh-discord/charts.js
COPY entry.sh /nh-discord/entry.sh
COPY package*.json /nh-discord/

RUN cd /nh-discord && \
    npm install && \
    chmod +x entry.sh

ENTRYPOINT ["/nh-discord/entry.sh"]
