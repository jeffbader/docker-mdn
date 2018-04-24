FROM alpine:3.7 as build
WORKDIR /app/mdn
RUN wget https://sanfrancisco.kapeli.com/feeds/zzz/mdn/CSS.tgz -O - | tar -xz
RUN wget https://sanfrancisco.kapeli.com/feeds/zzz/mdn/HTML.tgz -O - | tar -xz
RUN wget https://sanfrancisco.kapeli.com/feeds/zzz/mdn/JavaScript.tgz -O - | tar -xz

FROM nginx:1.13
COPY --from=build /app  /usr/share/nginx/html
COPY index.html /usr/share/nginx/html
