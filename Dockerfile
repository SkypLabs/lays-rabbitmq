#FROM docker.io/resin/raspberrypi2-debian:jessie
FROM docker.io/debian:jessie
MAINTAINER skyper@skyplabs.net

EXPOSE 5672

RUN apt-get update \
	&& apt-get install -y wget

RUN echo "deb http://www.rabbitmq.com/debian/ testing main" >> /etc/apt/sources.list \
	&& wget -qP /tmp https://www.rabbitmq.com/rabbitmq-signing-key-public.asc \
	&& apt-key add /tmp/rabbitmq-signing-key-public.asc \
	&& rm -f /tmp/rabbitmq-signing-key-public.asc

RUN apt-get update \
	&& apt-get install -y rabbitmq-server

COPY config/rabbitmq.config /etc/rabbitmq/

CMD ["rabbitmq-server"]
