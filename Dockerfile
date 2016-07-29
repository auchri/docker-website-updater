FROM auchri/docker-apache-php
MAINTAINER Christoph Auer <auer.chrisi@gmx.net>

RUN apt-get update && apt-get -y install git && apt-get clean && rm -r /var/lib/apt/lists/*

ARG WEB_ROOT=/var/www

# Add index file
ADD index.php "${WEB_ROOT}/html/index.php"
RUN rm "${WEB_ROOT}/html/index.html"

# Add config file
ADD config/ "${WEB_ROOT}/config/"

ADD start.sh /start.sh

CMD ["/start.sh"]
