FROM java:openjdk-8

ENV SCALA_VERSION 2.11.7

WORKDIR /usr/local

RUN curl -o scala-${SCALA_VERSION}.tgz http://downloads.typesafe.com/scala/${SCALA_VERSION}/scala-${SCALA_VERSION}.tgz
RUN tar -xf scala-${SCALA_VERSION}.tgz
RUN rm scala-${SCALA_VERSION}.tgz
RUN mv scala-${SCALA_VERSION} scala
RUN for exe in /usr/local/scala/bin/*; do ln -s ${exe} bin/"${exe##*/}"; done

CMD ["/usr/local/scala/bin/scala"]
