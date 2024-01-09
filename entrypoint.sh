#!/bin/sh -l

AWS_ACCESS_KEY_ID=$1
AWS_SECRET_ACCESS_KEY=$2
AWS_REGION=$3
ECR_REPOSITORY=$4
REGISTRY_TYPE=$5
IMAGE_NAME=$6
IMAGE_TAG=$7
AWS_ACCOUNT_ID=$8

aws ecr get-login-password --region $AWS_REGION | docker login -u AWS --password-stdin 991108593442.dkr.ecr.us-east-1.amazonaws.com/test
docker run -d -it --privileged $IMAGE_NAME:$IMAGE_TAG /usr/sbin/init
systemctl start httpd.service
docker build -t $IMAGE_NAME:$IMAGE_TAG .
docker push $IMAGE_NAME:$IMAGE_TAG
