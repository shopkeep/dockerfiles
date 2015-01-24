FROM debian:wheezy
MAINTAINER Paul Guelpa <paul@shopkeep.com>

RUN apt-get update && apt-get install -y curl

RUN curl https://packagecloud.io/install/repositories/basho/riak/script.deb | bash
RUN apt-get install -y riak=2.0.1-1 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY riak.conf /etc/riak/riak.conf
COPY bin/boot.sh /app/bin/boot.sh

# Open ports for HTTP and Protocol Buffers
EXPOSE 8098 8087

CMD /app/bin/boot.sh
