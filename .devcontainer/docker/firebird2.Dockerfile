# ┌─────────────────────────────────────┐
# │   Enter the Second Database Realm   │
# │                                     │
# │     For dev and study only.         │
# │   Change these settings with care!  │
# │                                     │
# │     *Stay vigilant, apprentice.*    │
# └─────────────────────────────────────┘

# Use the official Firebird image (Debian-based)
FROM firebirdsql/firebird:5-bullseye

# Who's responsible for this endeavor?
LABEL maintainer="Rodrigo Dantas"
LABEL email="rodrigo.dantas@hustletech.dev"

# Set environment variables for the second database initialization
ENV FIREBIRD2_DATABASE=${FIREBIRD2_DATABASE:-/firebird/data/second.fdb}
ENV FIREBIRD2_USER=${FIREBIRD2_USER:-SECURITY_OFFICER}
ENV FIREBIRD2_PASSWORD=${FIREBIRD2_PASSWORD:-differ3ntP@ss}
ENV FIREBIRD2_PORT=${FIREBIRD2_PORT:-3051}

# Expose the second Firebird's port
EXPOSE ${FIREBIRD2_PORT}

# Set working directory
WORKDIR /firebird/data

# Ensure the database storage path exists and has correct permissions
RUN mkdir -p /firebird/data && \
    chown -R firebird:firebird /firebird/data && \
    chmod 700 /firebird/data

# Define a volume to persist the second database data
VOLUME /firebird/data

# Default command to run Firebird
CMD ["/usr/local/firebird/bin/fbguard", "-forever"]