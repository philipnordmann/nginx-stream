FROM debian

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get autoremove -y

RUN apt-get install build-essential wget -y

RUN mkdir -p /tmp/nginx
COPY install.sh /tmp/nginx

WORKDIR /tmp/nginx
RUN /bin/bash /tmp/nginx/install.sh

RUN useradd -s /bin/false nginx

CMD [ "/usr/local/nginx/nginx" ]