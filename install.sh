#!/bin/bash

PCRE_VERSION=8.44
ZLIB_VERSION=1.2.11
OPENSSL_VERSION=1.1.1g
NGINX_VERSION=1.19.0

wd=$(pwd)

wget ftp://ftp.pcre.org/pub/pcre/pcre-${PCRE_VERSION}.tar.gz
tar -zxf pcre-${PCRE_VERSION}.tar.gz
cd pcre-${PCRE_VERSION}
./configure
make
make install

cd $wd

wget http://zlib.net/zlib-${ZLIB_VERSION}.tar.gz
tar -zxf zlib-${ZLIB_VERSION}.tar.gz
cd zlib-${ZLIB_VERSION}
./configure
make
make install

cd $wd

wget http://www.openssl.org/source/openssl-${OPENSSL_VERSION}.tar.gz
tar -zxf openssl-${OPENSSL_VERSION}.tar.gz
cd openssl-${OPENSSL_VERSION}
./Configure linux-x86_64 --prefix=/usr
make
make install

cd $wd


wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz
tar zxf nginx-${NGINX_VERSION}.tar.gz
cd nginx-${NGINX_VERSION}

./configure \
    --sbin-path=/usr/local/nginx/nginx \
    --conf-path=/usr/local/nginx/nginx.conf \
    --pid-path=/usr/local/nginx/nginx.pid \
    --with-pcre=../pcre-${PCRE_VERSION} \
    --with-zlib=../zlib-${ZLIB_VERSION} \
    --with-http_ssl_module \
    --with-stream \
    --with-mail=dynamic
make
make install