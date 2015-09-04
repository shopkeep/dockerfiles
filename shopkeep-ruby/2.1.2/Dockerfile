FROM buildpack-deps:trusty
MAINTAINER John Maguire <jmaguire@shopkeep.com>

ENV RUBY_MAJOR 2.1
ENV RUBY_VERSION 2.1.2
ENV RUBY_DOWNLOAD_SHA256 f22a6447811a81f3c808d1c2a5ce3b5f5f0955c68c9a749182feb425589e6635
ENV RUBYGEMS_VERSION 2.4.8

ENV GEM_HOME /usr/local/bundle
ENV PATH $GEM_HOME/bin:$PATH
ENV BUNDLE_APP_CONFIG $GEM_HOME

ENV BUNDLER_VERSION 1.10.6

# skip installing gem documentation
RUN echo 'install: --no-document\nupdate: --no-document' >> "$HOME/.gemrc"

# some of ruby's build scripts are written in ruby
# we purge this later to make sure our final image uses what we just built
RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y bison libgdbm-dev ruby \
  && rm -rf /var/lib/apt/lists/* \
  && mkdir -p /usr/src/ruby \
  && curl -fSL -o ruby.tar.gz "http://cache.ruby-lang.org/pub/ruby/$RUBY_MAJOR/ruby-$RUBY_VERSION.tar.gz" \
  && echo "$RUBY_DOWNLOAD_SHA256 *ruby.tar.gz" | sha256sum -c - \
  && tar -xzf ruby.tar.gz -C /usr/src/ruby --strip-components=1 \
  && rm ruby.tar.gz \
  && cd /usr/src/ruby \
  && autoconf \
  && ./configure --disable-install-doc \
  && make -j"$(nproc)" \
  && make install \
  && apt-get purge -y --auto-remove bison libgdbm-dev ruby \
  && gem update --system $RUBYGEMS_VERSION \
  && rm -r /usr/src/ruby

RUN gem install bundler --version "$BUNDLER_VERSION" \
  && bundle config --global path "$GEM_HOME" \
  && bundle config --global bin "$GEM_HOME/bin"
