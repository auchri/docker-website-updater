FROM auchri/docker-apache-php
MAINTAINER Christoph Auer <auer.chrisi@gmx.net>

RUN apt-get update && apt-get -y install git && apt-get clean && rm -r /var/lib/apt/lists/*

ENV DISABLE_FUNCTIONS "passthru,system,proc_open,popen,show_source"

# Add index file
ADD index.php /var/www/html/index.php
RUN rm /var/www/html/index.html

ADD start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
