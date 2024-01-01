#!/bin/sh

set -e

# Update package lists and install necessary packages using apk
apk update
apk add --no-cache wget gnupg

# Fetch Trivy repository key and add the repository
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "https://aquasecurity.github.io/trivy-repo/deb" | tee -a /etc/apk/repositories

# Install Trivy
apk add --no-cache trivy

# Run Trivy configuration commands if needed
trivy config

# Add additional commands or actions you want to perform here
# ...

# Your entrypoint logic ends here. You might want to add the command that starts your application.
exec "$@"
