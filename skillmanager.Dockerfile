FROM node:current-alpine3.12

WORKDIR /usr/src/skillkit/src
COPY skillkit/src .
RUN npm install

WORKDIR /usr/src/skillmanager/src
COPY ./skillmanager/src/package-sample.json ./package.json
#COPY ["./package-lock.json*", "./"]
RUN npm install

COPY ./skillmanager/src .
VOLUME ["/usr/src/skillmanager/src/config", "/usr/src/skillmanager/src/skills"]

EXPOSE 3000
CMD ["node", "index.js"]