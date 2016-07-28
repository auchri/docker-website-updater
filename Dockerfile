FROM auchri/docker-apache-php
MAINTAINER Christoph Auer <auer.chrisi@gmx.net>

RUN apt-get update && apt-get -y install git && apt-get clean && rm -r /var/lib/apt/lists/*

ENV DISABLE_FUNCTIONS ""

CMD ["/configure.sh"]
