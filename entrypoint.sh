#!/bin/sh -l

# Set AWS credentials
aws configure set aws_access_key_id "$1"
aws configure set aws_secret_access_key "$2"
aws configure set default.region "$3"

# Login to ECR
aws ecr get-login-password --region "$3" | docker login --username AWS --password-stdin "$4"

# Build and push the Docker image
docker build -t "$4" .
docker tag "$4":latest "$4":latest
docker push "$4":latest

echo "ECR login and push complete"
