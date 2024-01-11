#!/bin/sh -l

echo "Running Checkov Analysis on directory: $1"
checkov -d "$1" --skip-check "$2"  

time=$(date)
echo "time=$time" >> $GITHUB_ENV
