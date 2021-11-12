FROM node:14-alpine3.12 as build

WORKDIR /app

RUN npm install -g tiddlywiki

COPY mywiki mywiki

RUN tiddlywiki mywiki --build index

FROM nginx:1.20.1-alpine

COPY --from=build /app/mywiki/output/index.html /usr/share/nginx/html/index.html

