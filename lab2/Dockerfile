FROM ubuntu

RUN apt-get -y install php
RUN apt-get -y install symfony
RUN apt-get -y install composer

RUN mkdir lab2
COPY assets ./lab2/assets
COPY bin ./lab2/bin
COPY config ./lab2/config
COPY migrations ./lab2/migrations
COPY public ./lab2/public
COPY src ./lab2/src
COPY templates ./lab2/templates
COPY var ./lab2/var
COPY vendor ./lab2/vendor
COPY .env ./lab2
COPY composer.json ./lab2
COPY composer.lock ./lab2
COPY importmap.php ./lab2
COPY phpunit.xml.dist ./lab2
COPY symfony.lock ./lab2
COPY run.sh .

CMD "run.sh"