#!/bin/sh

set -e

# Update package lists and install necessary packages using apk
apk update
apk add --no-cache wget gnupg

# Install Trivy without GPG key verification
echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
apk add --no-cache trivy

# Run Trivy configuration commands if Needed
trivy config "$1"


