# BitTorrent Sync
# VERSION 0.1

FROM ubuntu:14.04

MAINTAINER Alexey Shevchenko <thefelikz@gmail.com>

# make sure the package repository is up to date
RUN echo "deb http://archive.ubuntu.com/ubuntu trusty main universe" > /etc/apt/sources.list && \
    apt-get update

# Install curl
RUN apt-get install -y curl

# Download and extract the executable to /usr/bin
RUN curl -o /usr/bin/btsync.tar.gz http://download-new.utorrent.com/endpoint/btsync/os/linux-x64/track/stable && \
    cd /usr/bin && \
    tar -xzvf btsync.tar.gz && \
    rm btsync.tar.gz && \
    mkdir -p /btsync_data

# setup directories
RUN mkdir -p /btsync/Scripts

# Web GUI and sync
EXPOSE 55555

ENTRYPOINT ["btsync"]
CMD ["--config", "/btsync_conf/sync-config.json", "--nodaemon"]
