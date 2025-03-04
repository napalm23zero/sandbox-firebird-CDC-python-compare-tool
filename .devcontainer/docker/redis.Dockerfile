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

# Use the official Redis image (Alpine variant for a lightweight image)
FROM redis:7.0-alpine

# The one who configures Redis must have wisdom
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Expose Redis port (default: 6379, but can be overridden)
EXPOSE ${REDIS_PORT}

# Set environment variables for Redis authentication
ENV REDIS_PASSWORD=${REDIS_PASSWORD}

# Run Redis with authentication enabled (if a password is set)
CMD ["sh", "-c", "redis-server --port ${REDIS_PORT} --requirepass ${REDIS_PASSWORD}"]