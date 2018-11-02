FROM maven 


RUN apt-get update && apt-get install -y --no-install-recommends automake bison flex g++ git libboost-all-dev libevent-dev libssl-dev libtool make pkg-config

RUN curl -sSL "http://apache.mirrors.spacedump.net/thrift/0.11.0/thrift-0.11.0.tar.gz" -o thrift.tar.gz && \
    mkdir -p /usr/src/thrift && \
    tar zxf thrift.tar.gz -C /usr/src/thrift --strip-components=1 && \ 
    rm thrift.tar.gz && \
    cd /usr/src/thrift && \
    ./configure  --without-python --without-cpp  && \
    make && \
    make install && \
    cd / && \
    rm -rf /usr/src/thrift

COPY . /code

WORKDIR /code

RUN mvn -q compile

# mvn exec:java
ENTRYPOINT [ "mvn", "-q", "exec:java" ]  