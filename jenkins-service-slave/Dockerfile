# Builds a jenkins slave with tools for testing DevOps code

FROM evarga/jenkins-slave
MAINTAINER Paul Guelpa <paul@shopkeep.com>

RUN apt-get update && apt-get install -y build-essential git

ADD https://get.docker.com/builds/Linux/x86_64/docker-1.6.2 /usr/local/bin/docker
ADD https://github.com/docker/compose/releases/download/1.3.2/docker-compose-Linux-x86_64 /usr/local/bin/docker-compose

RUN chmod +x /usr/local/bin/docker-compose /usr/local/bin/docker
