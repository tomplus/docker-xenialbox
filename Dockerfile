FROM ubuntu:xenial

RUN grep -v '^#' /etc/apt/sources.list \
 && apt-get update \
 && apt-get install -y apt-utils \
 && apt-get install -y wget curl netcat \
                       zip unzip unrar \
                       ffmpeg mplayer \
                       gcc make \
                       strace lsof \
                       tcpdump tcpflow \
                       netcat whois \
                       vim mc lftp \
                       sqlite3 redis-tools postgresql-client \
                       virtualenv python3-dev \
 && rm -rf /var/lib/apt/lists/* \
 && apt-get clean

RUN wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.9.0/bin/linux/amd64/kubectl \
 && chmod +x /usr/local/bin/kubectl

CMD ["bash"]
