FROM auchri/docker-apache-php
MAINTAINER Christoph Auer <auer.chrisi@gmx.net>

RUN apt-get update && apt-get -y install git && apt-get clean && rm -r /var/lib/apt/lists/*

# Add index file
ADD index.php /var/www/html/index.php
RUN rm /var/www/html/index.html

# Add config file
ADD config/ /var/www/html/.config/

ADD start.sh /start.sh

CMD ["/start.sh"]
