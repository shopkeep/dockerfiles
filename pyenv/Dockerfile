FROM ubuntu:18.04

# configure default environment
ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PATH /root/.pyenv/shims:/root/.pyenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV PYENV_ROOT /root/.pyenv
ENV PYTHONDONTWRITEBYTECODE 1

# install system-level dependencies
RUN apt-get update && \
    apt-get install -y git make build-essential libssl-dev zlib1g-dev \
                       libbz2-dev libreadline-dev libsqlite3-dev wget curl \
                       llvm libncurses5-dev libncursesw5-dev xz-utils tk-dev

# install and configure pyenv
RUN curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
RUN pyenv update

# install all supported Python versions
RUN pyenv install 2.7.15
RUN pyenv install 3.5.5
RUN pyenv install 3.6.5
RUN pyenv install 3.7.0
RUN pyenv install 3.9.13
RUN pyenv rehash
RUN pyenv global 3.9.13 3.7.0 3.6.5 3.5.5 2.7.15

# install build and test dependencies
RUN pip install --upgrade pip tox wheel

WORKDIR /usr/src/app
CMD [ "python" ]
