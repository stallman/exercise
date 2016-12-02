FROM ubuntu:16.04
MAINTAINER RSH <stallmantrue@gmail.com>
COPY build.sh /root/build.sh
RUN apt-get update && apt-get install -y curl git file sudo gcc make build-essential
