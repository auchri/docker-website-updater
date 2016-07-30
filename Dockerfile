FROM auchri/docker-apache-php
MAINTAINER Christoph Auer <auer.chrisi@gmx.net>

RUN apt-get update && apt-get -y install sudo git && apt-get clean && rm -r /var/lib/apt/lists/*

ARG WEB_ROOT=/var/www
ARG HTML_DIR="${WEB_ROOT}/html"
ARG CONFIG_DIR="${WEB_ROOT}/config"
ARG SSH_DIR="${WEB_ROOT}/.ssh"

# Add index file
ADD index.php "${HTML_DIR}/index.php"
RUN rm "${HTML_DIR}/index.html"

# Add config file
ADD config/ "${CONFIG_DIR}/"

# Set owner
RUN chown www-data:www-data "${WEB_ROOT}" -R

# Create ssh dir
RUN sudo -H -u www-data sh -c "mkdir ~/.ssh"

# Link private key
RUN sudo -H -u www-data sh -c "ln -s ${CONFIG_DIR}/private.key ~/.ssh/id_rsa"

ADD start.sh /start.sh

CMD ["/start.sh"]
