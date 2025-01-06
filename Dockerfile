# Use a base image
FROM ubuntu:24.10

# Install Python 3.12
RUN apt-get update && apt-get install -y \
    ffmpeg libsm6 libxext6 \
    python3.12 \
    python3.12-venv \
    python3-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Copy repository into container
COPY . /app
WORKDIR /app

# Run installation script
RUN  /app/install.sh

ENTRYPOINT ["/app/.venv/bin/exo"]
