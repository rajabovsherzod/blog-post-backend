FROM node:14.18.3

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

# app-config papkasini config papkasiga nusxalash
RUN mkdir -p /usr/src/app/config && cp -r /usr/src/app/app-config/* /usr/src/app/config/

RUN npm run db:migrate

RUN npm run db:load
