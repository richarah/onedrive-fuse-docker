FROM ubuntu:22.04

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y pkg-config openssl libfuse-dev git cargo libssl-dev
WORKDIR /app

RUN git clone https://github.com/oxalica/onedrive-fuse

WORKDIR /app/onedrive-fuse

RUN cargo install onedrive-fuse

# TODO: auth

WORKDIR /onedrive
CMD onedrive-fuse mount /onedrive
