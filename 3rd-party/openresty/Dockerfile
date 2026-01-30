FROM turknethub/tn-wolfios:0.0.6-169 AS build

RUN apk update && apk add --no-cache \
build-base=1-r8 \
gcc=15.2.0-r6 \
git=2.52.0-r2 \
make=4.4.1-r8 \
pcre-dev=8.45-r7 \
perl=5.42.0-r1 \
pkgconf=2.5.1-r1 \
readline-dev=8.3-r1 \
zlib-dev=1.3.1-r6

COPY version /tmp/version

WORKDIR /tmp

RUN wget https://www.lua.org/ftp/lua-5.1.5.tar.gz \
    && tar -zxvf lua-5.1.5.tar.gz \
    && cd lua-5.1.5 \
    && make linux test \
    && make install \
    && rm -rf /tmp/lua-5.1.5*
    

WORKDIR /tmp

RUN git clone https://github.com/nginx-modules/ngx_cache_purge.git \
    && git clone https://github.com/yaoweibin/nginx_upstream_check_module.git \
    && wget https://openresty.org/download/openresty-$(cat /tmp/version).tar.gz \
    && tar -zxvf openresty-$(cat /tmp/version).tar.gz \
    && cd openresty-$(cat /tmp/version) \
    && ./configure --add-module=/tmp/ngx_cache_purge --add-module=/tmp/nginx_upstream_check_module --with-http_v2_module --with-http_realip_module \
    && make && make install \
    && rm -rf /tmp/*

WORKDIR /tmp


RUN wget https://luarocks.org/releases/luarocks-3.9.1.tar.gz \
    && tar zxpf luarocks-3.9.1.tar.gz \
    && cd luarocks-3.9.1 \
    && ./configure --prefix=/usr/local --with-lua=/usr/local \
    && make build && make install \
    && rm -rf /tmp/luarocks-3.9.1*

RUN /usr/local/bin/luarocks install lua-resty-cookie

RUN chmod +x /usr/local/openresty/bin/resty

COPY ./lua /etc/openresty/lua
RUN chmod +x /etc/openresty/lua/*.lua

EXPOSE 80 443

CMD ["/usr/local/openresty/nginx/sbin/nginx", "-g", "daemon off;"]
