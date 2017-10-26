FROM golang:alpine

WORKDIR /app
ENV GOLDFISH_VERSION=v0.7.4
RUN apk add --update curl && \
    curl -L -o /app/goldfish https://github.com/Caiyeon/goldfish/releases/download/$GOLDFISH_VERSION/goldfish-linux-amd64 && \
    chmod a+x /app/goldfish &&
    cp config.hcl /app/config.hcl

ENTRYPOINT ["/app/goldfish", "-config", "/app/config.hcl"]
