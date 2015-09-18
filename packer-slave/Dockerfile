FROM evarga/jenkins-slave
MAINTAINER John Maguire <jmaguire@shopkeep.com>

RUN apt-get update && apt-get install -y \
  unzip \
  git

RUN wget -O /tmp/packer.zip https://dl.bintray.com/mitchellh/packer/packer_0.8.6_linux_amd64.zip && unzip /tmp/packer.zip -d /usr/bin
