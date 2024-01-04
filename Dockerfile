FROM amazon/aws-cli:latest

RUN pip install awscli 

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
