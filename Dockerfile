FROM debian:buster-slim

RUN apt update -y
RUN apt upgrade -y

RUN apt install -y patch tar autotools-dev make libc6 libpcap-dev g++ gcc libboost-iostreams-dev libboost-program-options-dev libboost-regex-dev curl

RUN mkdir /build
WORKDIR /build

RUN curl -L 'https://github.com/onotelli/justniffer/archive/refs/tags/v0.5.15.tar.gz' > package.tar.gz
RUN tar -xf package.tar.gz 

WORKDIR /build/justniffer-0.5.15

RUN ./configure
RUN make
RUN make install

WORKDIR /home

ENTRYPOINT ["justniffer"]

