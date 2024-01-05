# Use an image that includes AWS CLI
FROM amazon/aws-cli:latest

RUN yum update -y && yum install -y \
    yum-utils \
    device-mapper-persistent-data \
    lvm2 \
    jq \
    curl \
    tar \
    unzip

# Install Docker CLI manually
RUN curl -fsSL https://download.docker.com/linux/static/stable/x86_64/docker-20.10.11.tgz -o docker.tgz && \
    tar xzvf docker.tgz --strip 1 -C /usr/local/bin docker/docker && \
    rm docker.tgz
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
