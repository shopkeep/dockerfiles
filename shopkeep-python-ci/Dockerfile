FROM python:3.4.2
MAINTAINER John Maguire <jmaguire@shopkeep.com>

RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ jessie-pgdg main" | tee -a /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  apt-key add -

RUN apt-get update && apt-get install -y \
    openssh-server \
    openjdk-7-jdk \
    postgresql-9.3

# Allow Jenkins Slave SSH
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Allow local PSQL Connections
RUN sed -i 's/peer/trust/g' /etc/postgresql/9.3/main/pg_hba.conf
RUN sed -i 's/md5/trust/g' /etc/postgresql/9.3/main/pg_hba.conf

# Standard SSH port
EXPOSE 22
