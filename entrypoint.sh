#!/bin/sh

set -e

# Update package lists and install necessary packages using apk
apk update
apk add --no-cache wget gnupg

# Create the directory if it doesn't exist
mkdir -p /usr/share/keyrings/

# Fetch Trivy repository key and add the repository
wget -qO /usr/share/keyrings/trivy.gpg https://aquasecurity.github.io/trivy-repo/deb/public.key

# Add Trivy repository to sources list
echo "https://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories

# Install Trivy
apk add --no-cache trivy

# Run Trivy configuration commands if needed
trivy config

# Add additional commands or actions you want to perform here
# ...

# Your entrypoint logic ends here. You might want to add the command that starts your application.
exec "$@"
