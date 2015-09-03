FROM shopkeep-ruby:2.1.2
MAINTAINER John Maguire <jmaguire@shopkeep.com>

ENV RACK_ENV production
ENV HIPCHAT_AUTH_TOKEN <REPLACEME>

COPY aws_sns_to_hipchat /

RUN bundle install

EXPOSE 8088

CMD ["ruby", "aws_sns_to_hipchat.rb", "-p 8088"]

