FROM docker:latest

# Install AWS CLI
RUN apt update && apt upgrade \
apt install curl \
apt-get install zip \
curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip"

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
