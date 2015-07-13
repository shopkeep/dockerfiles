FROM java:openjdk-8

RUN mkdir /opt/spark
WORKDIR /opt/spark
ADD http://d3kbcqa49mib13.cloudfront.net/spark-1.4.0-bin-hadoop2.6.tgz /tmp/

RUN tar -zxf /tmp/spark-1.4.0-bin-hadoop2.6.tgz -C /opt/spark --strip-components=1

