FROM cgr.dev/chainguard/wolfi-base:latest

RUN apk update

RUN apk add --no-cache \
bash=5.2.32-r2 \
busybox=1.36.1-r10 \
curl=8.10.0-r0 \
dumb-init=1.2.5-r3 \
glibc-locale-en=2.40-r1 \
icu-dev=75.1-r2 \
libssl3=3.3.2-r2 \
libstdc++=14.2.0-r1 \
libunwind-dev=1.8.1-r1 \
libuuid=2.40.2-r0 \
ncurses-dev=6.5_p20240629-r0 \
# TODO: Critic zaafiyet var diye commentlendi.
# CRITICAL CVE-2024-5535
# https://scout.docker.com/v/CVE-2024-5535
# openssl-config=3.3.0-r5 \
openssl-dev=3.3.2-r2 \
openssl-doc=3.3.2-r2 \
openssl=3.3.2-r2 \
tzdata=2024a-r3 \
wget=1.24.5-r4 \
zlib-dev=1.3.1-r4


RUN adduser -D -u 1000 -g 0 appuser
RUN chown -R appuser:0 /home/appuser && chmod -R g=u /home/appuser
RUN cp /usr/share/zoneinfo/Turkey /etc/localtime

# TODO: Critic zaafiyet var diye commentlendi.
# Repoya openssl.cnf manuel eklendi.
COPY openssl.cnf /etc/ssl/openssl.cnf

# RUN sed -i 's/providers = provider_sect/providers = provider_sect\n\
# ssl_conf = ssl_sect\n\
# \n\
# [ssl_sect]\n\
# system_default = system_default_sect\n\
# \n\
# [system_default_sect]\n\
# Options = UnsafeLegacyRenegotiation/' /etc/ssl/openssl.cnf

# RUN sed -i '1i openssl_conf = default_conf' /etc/ssl/openssl.cnf && \
# echo -e "\n[ default_conf ]\nssl_conf = ssl_sect\n[ssl_sect]\nsystem_default = system_default_sect\n[system_default_sect]\nMinProtocol = TLSv1\nCipherString = DEFAULT:@SECLEVEL=1" >> /etc/ssl/openssl.cnf

CMD ["tail", "-f", "/dev/null"]
