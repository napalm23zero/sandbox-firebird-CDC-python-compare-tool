# ┌─────────────────────────────────────┐
# │  The Dark Side of Devcontainers     │
# │                                     │
# │  For dev and study use ONLY.        │
# │  Deploy this to production?         │
# │  I will personally find you,        │
# │  and trust me, you won’t like it.   │
# │                                     │
# │  *You’ve been warned, apprentice.*  │
# └─────────────────────────────────────┘

# Use the official LocalStack image
FROM localstack/localstack:latest

# Who dares virtualize AWS services?
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Expose default LocalStack ports
EXPOSE 4566 4571

# Set environment variables for LocalStack configuration
ENV SERVICES="dynamodb,s3,sqs,sns"
ENV DEFAULT_REGION="us-east-1"
ENV DATA_DIR="/var/lib/localstack"

# Define a volume for LocalStack persistent data (optional)
VOLUME /var/lib/localstack

# Start LocalStack
CMD ["docker-entrypoint.sh"]