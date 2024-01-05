FROM amazon/aws-cli:latest

RUN curl -fsSL https://get.docker.com | sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
