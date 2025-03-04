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

# Use the official Firebird image (Debian-based)
FROM firebirdsql/firebird:5-bullseye

# Who's responsible for this madness?
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Set environment variables for database initialization
ENV FIREBIRD1_DATABASE=${FIREBIRD1_DATABASE:-/firebird/data/main.fdb}
ENV FIREBIRD1_USER=${FIREBIRD1_USER:-SYSDBA}
ENV FIREBIRD1_PASSWORD=${FIREBIRD1_PASSWORD:-masterkey}
ENV FIREBIRD1_PORT=${FIREBIRD1_PORT:-3050}

# Expose Firebird's default port
EXPOSE ${FIREBIRD1_PORT}

# Set working directory
WORKDIR /firebird/data

# Ensure the database storage path exists and has correct permissions
RUN mkdir -p /firebird/data && \
    chown -R firebird:firebird /firebird/data && \
    chmod 700 /firebird/data

# Define a volume to persist database data
VOLUME /firebird/data

# Default command to run Firebird
CMD ["/usr/local/firebird/bin/fbguard", "-forever"]
