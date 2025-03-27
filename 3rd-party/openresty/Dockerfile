FROM turknethub/tn-wolfios:0.0.4-98 AS build

RUN apk update && apk add --no-cache \
build-base=1-r8 \
gcc=14.2.0-r2 \
git=2.46.0-r2 \
make=4.4.1-r3 \
pcre-dev=8.45-r3 \
perl=5.40.0-r3 \
pkgconf=2.3.0-r0 \
readline-dev=8.2.13-r0

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
