#!/bin/sh

set -e

# Update package lists and install necessary packages using apk
apk update
apk add --no-cache wget gnupg
# Fetch Trivy repository key and add the repository
wget -qO /usr/share/keyrings/trivy.gpg https://aquasecurity.github.io/trivy-repo/deb/public.key

# Add Trivy repository to sources list
echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install Trivy
apk add --no-cache trivy

# Run Trivy configuration commands if needed
trivy config "$1"


