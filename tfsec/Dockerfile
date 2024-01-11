FROM alpine:3.10

RUN apk add --no-cache wget ca-certificates

RUN wget -q -O /usr/local/bin/tfsec https://github.com/tfsec/tfsec/releases/latest/download/tfsec-linux-amd64 && \
    chmod +x /usr/local/bin/tfsec

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
