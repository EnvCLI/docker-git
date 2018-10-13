############################################################
# Dockerfile
############################################################

# Set the base image
FROM ubuntu:18.04

############################################################
# Configuration
############################################################
ENV VERSION "2.9.5"

############################################################
# Installation
############################################################

RUN apt-get update &&\
	apt-get install -y bash wget make autoconf libcurl4-gnutls-dev gettext gcc zlib1g-dev &&\
	wget https://www.kernel.org/pub/software/scm/git/git-${VERSION}.tar.gz &&\
	tar xf git-${VERSION}.tar.gz &&\
	cd git-${VERSION} &&\
	./configure --prefix=/usr/local --without-tcltk &&\
	make all &&\
	make install &&\
	rm -rf git-${VERSION} &&\
	apt-get remove -y wget make autoconf libcurl4-gnutls-dev gcc zlib1g-dev

############################################################
# Execution
############################################################
CMD [ "git", "help"]
