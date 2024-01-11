#!/bin/sh -l

# Install TFLint
curl -L "$(curl -s https://api.github.com/repos/terraform-linters/tflint/releases/latest | grep -o -E "https://.+?linux_amd64\.zip")" -o tflint.zip
unzip tflint.zip
sudo mv tflint /usr/local/bin/

# Run TFLint
tflint

# Set the time as an output variable
time=$(date)
echo "time=$time" >> $GITHUB_ENV
