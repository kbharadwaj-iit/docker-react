#use docker image

FROM node:alpine as builder
WORKDIR '/app'

#download

COPY package*.json ./
RUN npm install
COPY ./ ./

#tell image what to do

CMD ["npm","run","start"]


FROM nginx 
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

