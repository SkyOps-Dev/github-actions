#!/bin/sh

set -e

# Update package lists and install necessary packages using apk
apk update
apk add --no-cache wget gnupg

# Fetch Trivy repository key
wget -qO /tmp/trivy.gpg https://aquasecurity.github.io/trivy-repo/deb/public.key

# Install Trivy with GPG key verification
wget -O /etc/apk/keys/trivy.rsa.pub https://aquasecurity.github.io/trivy-repo/deb/trivy.rsa.pub
echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
apk add --no-cache trivy

# Run Trivy configuration commands if needed
trivy config "$1"


