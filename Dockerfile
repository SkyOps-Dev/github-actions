FROM docker:latest

# Install AWS CLI
RUN apk --no-cache add \
    python3 \
    py3-pip \
    && pip3 install --upgrade pip \
    && pip3 install awscli

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
