#!/bin/sh -l

AWS_ACCOUNT_ID=$1
AWS_REGION=$2
ECR_REPOSITORY=$3
REGISTRY_TYPE=$4
IMAGE_NAME=$5
IMAGE_TAG=$6

aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com

docker build -t $IMAGE_NAME:$IMAGE_TAG .

docker push $IMAGE_NAME:$IMAGE_TAG
