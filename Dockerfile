FROM node:dubnium

ARG TAG
ARG FORMN_CLI_VERSION

ENV MYSQL_USER=root

WORKDIR /var/node

RUN npm install -g formn-cli@${FORMN_CLI_VERSION}

COPY ["./connections.json", "./connections.json"]

ENTRYPOINT ["formn", "migrate", "--migrations-dir", "/migrations"]
CMD ["up"]
