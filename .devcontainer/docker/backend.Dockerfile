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

# Who dares summon the Sith Lord of APIs?
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Set environment variables
ENV APP_ENV=${APP_ENV:-DEVELOPMENT}
ENV APP_PORT=${APP_PORT:-8080}

# Install essential packages and dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    lsof \
    procps \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /workspace

# Expose the port (respect the Force and the .env file settings)
EXPOSE ${APP_PORT}

# Ensure the container keeps running (because a dead API serves no one)
CMD ["tail", "-f", "/dev/null"]