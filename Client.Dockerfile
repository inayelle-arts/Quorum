FROM node:alpine as builder
RUN npm i -g @angular/cli
WORKDIR /src
COPY . .
RUN npm install
RUN ng build --output-hashing none --outputPath /dist

FROM nginx:alpine as runner
WORKDIR /usr/share/nginx/html
COPY --from=builder /dist .
