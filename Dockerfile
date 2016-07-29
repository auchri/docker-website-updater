FROM auchri/docker-apache-php
MAINTAINER Christoph Auer <auer.chrisi@gmx.net>

RUN apt-get update && apt-get -y install git && apt-get clean && rm -r /var/lib/apt/lists/*

ARG WEB_ROOT=/var/www/html

# Add index file
ADD index.php "${WEB_ROOT}/index.php"
RUN rm "${WEB_ROOT}/index.html"

# Add config file
ADD config/ "/var/www/config/"

ADD start.sh /start.sh

CMD ["/start.sh"]
