FROM floryn90/hugo:0.155.0 AS builder

WORKDIR /src

COPY . .

RUN hugo --minify --config hugo.yaml

FROM nginx:alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=builder /src/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
