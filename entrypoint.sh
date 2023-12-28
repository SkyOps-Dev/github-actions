#!/bin/sh -l

# Run TFSec
tfsec "${INPUT_TFSEC_ARGS}"

# Set the time as output
time=$(date)
echo "time=$time" >> $GITHUB_ENV
