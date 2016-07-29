FROM auchri/docker-apache-php
MAINTAINER Christoph Auer <auer.chrisi@gmx.net>

RUN apt-get update && apt-get -y install git && apt-get clean && rm -r /var/lib/apt/lists/*

ARG WEB_ROOT=/var/www
ARG HTML="${WEB_ROOT}/html"
ARG CONFIG="${WEB_ROOT}/config"
ARG SSH="${WEB_ROOT}/.ssh"

# Add index file
ADD index.php "${HTML}/index.php"
RUN rm "${HTML}/index.html"

# Add config file
ADD config/ "${CONFIG}/"

# Create ssh dir
RUN mkdir "${SSH}"

# Link private key
RUN ln -s "${CONFIG}/private.key" "${SSH}/id_rsa"

# Set owner
RUN chown www-data:www-data "${WEB_ROOT}" -R

ADD start.sh /start.sh

CMD ["/start.sh"]
