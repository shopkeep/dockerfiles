FROM debian:wheezy
MAINTAINER Paul Guelpa <paul@shopkeep.com>

RUN apt-get update && apt-get install -y curl

RUN curl https://packagecloud.io/install/repositories/basho/riak/script.deb | bash
RUN apt-get install -y riak=2.0.1-1 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD riak.conf /etc/riak/riak.conf

# Open ports for HTTP and Protocol Buffers
EXPOSE 8098 8087

CMD riak start && tail -f /var/log/riak/console.log
