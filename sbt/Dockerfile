FROM shopkeep/scala:2.11.7

ENV SBT_VERSION 0.13.8

RUN curl -L -o sbt.deb http://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb
RUN dpkg -i sbt.deb
RUN rm sbt.deb

CMD ["sbt"]
