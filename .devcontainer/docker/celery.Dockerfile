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

# Use the official Python image (slim variant for efficiency)
FROM python:3.11-slim

# The Sith Lord of Task Queues
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    lsof \
    procps \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Install Celery and Redis
RUN pip install celery redis

# Set the working directory
WORKDIR /workspace

# Expose Celery worker logs
EXPOSE 5555

# Define Celery worker execution
CMD ["celery", "-A", "app.tasks", "worker", "--loglevel=info"]
