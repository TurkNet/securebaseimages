FROM cgr.dev/chainguard/wolfi-base:latest

RUN apk update

RUN apk add --no-cache \
bash=5.3-r12 \
busybox=1.37.0-r60 \
curl=8.20.0-r1 \
dumb-init=1.2.5-r11 \
gettext=1.0-r6 \
glibc-locale-en=2.43-r8 \
icu-dev=78.3-r1 \
libcrypto3=3.6.3-r0 \
libssl3=3.6.3-r0 \
libstdc++=16.1.0-r2 \
libunwind-dev=1.8.3-r4 \
libuuid=2.42.1-r1 \
# TODO: Critic zaafiyet var diye commentlendi.
# CRITICAL CVE-2024-5535
# https://scout.docker.com/v/CVE-2024-5535
# openssl-config=3.3.0-r5 \
ncurses-dev=6.6.20260608-r0 \
openssl=3.6.3-r0 \
openssl-dev=3.6.3-r0 \
openssl-doc=3.6.3-r0 \
tzdata=2026b-r0 \
wget=1.25.0-r14 \
zlib-dev=1.3.2-r3

RUN adduser -D -u 1000 -g 0 appuser
RUN chown -R appuser:0 /home/appuser && chmod -R g=u /home/appuser
RUN mkdir -p /app/data
RUN chmod -R 777 /app
RUN chown -R root:root /app


#RUN cp /usr/share/zoneinfo/Turkey /etc/localtime

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
