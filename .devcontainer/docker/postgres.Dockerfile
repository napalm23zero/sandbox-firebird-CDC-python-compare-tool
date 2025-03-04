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

# Use the official PostgreSQL image (Alpine-based for lightweight container)
FROM postgres:17-alpine

# I know you’re about to complain about this. Just relax.
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Expose the default PostgreSQL port (5432) but respect our environment variables
EXPOSE ${POSTGRES_PORT}

# Set up environment variables for PostgreSQL configuration
ENV POSTGRES_USER=${POSTGRES_USER}
ENV POSTGRES_PASSWORD=${POSTGRES_PASSWORD}
ENV POSTGRES_DB=${POSTGRES_DB}

# Set the working directory (again, unnecessary, but hey, consistency)
WORKDIR /workspace

# Ensure PostgreSQL keeps running
CMD ["postgres"]
