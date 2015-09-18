FROM hashicorp/packer
MAINTAINER John Maguire <jmaguire@shopkeep.com>

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    openssh-server \
    openjdk-7-jdk

# Allow Jenkins Slave SSH
RUN sed -i 's|session    required     pam_loginuid.so|session    optional     pam_loginuid.so|g' /etc/pam.d/sshd
RUN mkdir -p /var/run/sshd

# Standard SSH port
EXPOSE 22
