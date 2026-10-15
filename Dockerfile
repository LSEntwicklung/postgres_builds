FROM ubuntu:trusty

RUN apt-get update && apt-get install -y build-essential bison flex && rm -rf /var/lib/apt/lists/*
  
ENV PG_VERSION=18.6

COPY postgresql-${PG_VERSION}.tar.bz2 /postgresql-${PG_VERSION}.tar.bz2

RUN tar -xjf postgresql-${PG_VERSION}.tar.bz2 && rm -f postgresql-${PG_VERSION}.tar.bz2

WORKDIR /postgresql-${PG_VERSION}

RUN ./configure --without-icu --without-readline --without-zlib --with-system-tzdata=/usr/share/zoneinfo && make

RUN make install
