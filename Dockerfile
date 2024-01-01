FROM alpine:latest

# Install required tools
RUN apk add --no-cache ca-certificates wget

# Fetch Trivy and set permissions
RUN ARCH=$(apk --print-arch); \
    wget -qO /usr/local/bin/trivy "https://github.com/aquasecurity/trivy/releases/download/v0.20.0/trivy_0.20.0_Linux-${ARCH}" && \
    chmod +x /usr/local/bin/trivy

# Optionally, update Trivy's vulnerability database
RUN trivy --download-db-only

COPY entrypoint.sh /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

