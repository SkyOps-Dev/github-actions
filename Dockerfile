FROM amazon/aws-cli:latest

RUN yum update -y && yum install -y \
    yum-utils \
    device-mapper-persistent-data \
    lvm2

RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

RUN yum install -y docker-ce docker-ce-cli containerd.io

RUN systemctl start docker
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
