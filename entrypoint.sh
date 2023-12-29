#!/bin/bash

set -e

echo "Setting up Trivy..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | tee /usr/share/keyrings/trivy.gpg > /dev/null
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb $(lsb_release -sc) main" | tee -a /etc/apt/sources.list.d/trivy.list

echo "Updating package index..."
apt-get update
echo "Installing Trivy..."
apt-get install -y wget apt-transport-https gnupg lsb-release trivy

echo "Running Trivy..."

trivy config terraform/env
