FROM alpine:latest

# Pull the Trivy Docker image
RUN apk add --no-cache ca-certificates && \
    wget -qO /usr/local/bin/trivy https://github.com/aquasecurity/trivy/releases/download/v0.20.0/trivy_0.20.0_Linux-$(apk --print-arch | sed 's/x86_64/amd64/') && \
    chmod +x /usr/local/bin/trivy

# Optionally, update Trivy's vulnerability database
RUN trivy --download-db-only

COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

