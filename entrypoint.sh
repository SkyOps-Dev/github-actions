#!/bin/sh

set -e

# Update package lists and install necessary packages
apt-get update
apt-get install -y wget apt-transport-https gnupg lsb-release

# Fetch Trivy repository key and add the repository
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | tee -a /etc/apt/sources.list.d/trivy.list

# Update package lists again after adding Trivy repository
apt-get update

# Install Trivy
apt-get install -y trivy

# Run Trivy configuration commands if needed
trivy config

# Add additional commands or actions you want to perform here
# ...

# Your entrypoint logic ends here. You might want to add the command that starts your application.
exec "$@"
