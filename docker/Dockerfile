FROM ubuntu:18.04
RUN apt-get update && apt-get -y install curl && curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y software-properties-common && add-apt-repository ppa:longsleep/golang-backports && apt-get update && apt-get -y install build-essential golang-go nodejs git

RUN git config --global http.https://gopkg.in.followRedirects true

WORKDIR /opt

RUN git clone https://github.com/abassian/go-abassian.git

WORKDIR /opt/go-abassian

RUN make gbas

RUN chmod a+x /opt/go-abassian/build/bin/gbas
RUN ln -s /opt/go-abassian/build/bin/gbas /usr/bin/geth
RUN ln -s /opt/go-abassian/build/bin/gbas /usr/bin/gbas

WORKDIR /opt

RUN git config --global http.https://gopkg.in.followRedirects true
RUN git clone --branch rpool --single-branch https://github.com/abassian/mine-pool.git open-ethereum-pool

WORKDIR /opt/open-ethereum-pool

RUN make

WORKDIR /opt/open-ethereum-pool/www

RUN npm install -g ember-cli@2.9.1 bower && npm install && bower --allow-root install && ./build.sh

WORKDIR /

RUN apt-get update && apt-get -y install nginx
RUN apt-get update && apt-get -y install supervisor python-pip net-tools && pip install supervisor-stdout

ENV DEBIAN_FRONTEND noninteractive

COPY nginx.conf /etc/nginx/sites-enabled/default
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY pool.conf /etc/security/limits.d/pool.conf
COPY payouts.sh /payouts.sh
COPY pool.sh /pool.sh
COPY pool_4b.sh /pool_4b.sh
COPY pool_9b.sh /pool_9b.sh
COPY gbas.sh /gbas.sh

RUN chmod a+x /payouts.sh && chmod a+x /pool.sh && chmod a+x /gbas.sh && chmod a+x /pool_4b.sh && chmod a+x /pool_9b.sh

CMD ["/usr/bin/supervisord"]

# VOLUME ["/root/.abassian"]

EXPOSE 8008 80
