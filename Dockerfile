# FROM alpine:3.16
# LABEL maintainer "ian@iay.org.uk"

# #
# # Add packages
# #
# #RUN apk add --no-cache \
# #	openssl
# RUN apt-get -y install openssl
FROM jordi/ubuntu
MAINTAINER Jordi Íñigo Griera

RUN apt-get update

# installing an editor is not necessary, but is handy
RUN apt-get -y install nano
RUN apt-get -y install vim
RUN apt-get -y install emacs25-nox

# installing an netstat is not necessary, but is handy
RUN apt-get install net-tools

# openssl is the only required thing to install
RUN apt-get -y install openssl

ADD bash_history /root/.bash_history
ADD dades /tmp/dades

RUN echo "alias ll='ls -l'" >> /root/.bashrc
RUN bash -c "history -a"

WORKDIR /root
