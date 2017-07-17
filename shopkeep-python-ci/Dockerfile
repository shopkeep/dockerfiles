FROM buildpack-deps:jessie
MAINTAINER DevOps <devops@shopkeep.com>

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/miniconda2/bin
ENV LANG C.UTF-8

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" | tee -a /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  apt-key add -

RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee /etc/apt/sources.list.d/webupd8team-java.list
RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
RUN apt-get update
RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | debconf-set-selections
RUN apt-get install -y oracle-java8-installer

RUN apt-get update && apt-get install -y  \
    openssh-server \
    postgresql-9.3

# Install Conda
RUN wget http://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O miniconda.sh \
  && chmod +x miniconda.sh \
  && ./miniconda.sh -b \
  && conda update --yes conda

# Allow Jenkins Slave SSH
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Allow local PSQL Connections
RUN sed -i 's/peer/trust/g' /etc/postgresql/9.3/main/pg_hba.conf
RUN sed -i 's/md5/trust/g' /etc/postgresql/9.3/main/pg_hba.conf

# Standard SSH port
EXPOSE 22
