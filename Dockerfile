############################################################
# Dockerfile
############################################################

# Set the base image
FROM ubuntu:18.04

############################################################
# Configuration
############################################################
ENV VERSION "2.22.0"

############################################################
# Configuration
############################################################
ADD rootfs /

############################################################
# Installation
############################################################

RUN apt-get update &&\
	apt-get install -y --no-install-recommends bash wget ca-certificates make autoconf libcurl4-gnutls-dev gettext gcc zlib1g-dev &&\
	wget https://www.kernel.org/pub/software/scm/git/git-${VERSION}.tar.gz &&\
	tar xf git-${VERSION}.tar.gz &&\
	cd git-${VERSION} &&\
	./configure --prefix=/usr/local --without-tcltk &&\
	make all &&\
	make install &&\
	rm -rf git-${VERSION} &&\
	apt-get remove -y wget ca-certificates make autoconf libcurl4-gnutls-dev gcc zlib1g-dev &&\
	rm -rf /var/lib/apt/lists/*

############################################################
# Execution
############################################################
CMD [ "git", "help"]
