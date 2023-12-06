FROM ubuntu:22.04

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y pkg-config openssl libfuse-dev git cargo libssl-dev
WORKDIR /app

RUN git clone https://github.com/oxalica/onedrive-fuse

WORKDIR /app/onedrive-fuse

RUN cargo install onedrive-fuse

# TODO: auth

COPY scripts/auth.sh /scripts/auth.sh
RUN chmod +x /scripts/auth.sh

WORKDIR /onedrive
CMD ./auth && onedrive-fuse mount /onedrive
