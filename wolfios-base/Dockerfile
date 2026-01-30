FROM cgr.dev/chainguard/wolfi-base:latest

RUN apk update

RUN apk add --no-cache \
bash=5.2.37-r30 \
busybox=1.37.0-r30 \
curl=8.12.1-r0 \
dumb-init=1.2.5-r5 \
gettext=0.22.5-r1 \
glibc-locale-en=2.40-r23 \
icu-dev=75.1-r8 \
libcrypto3=3.6.1-r0 \
libssl3=3.6.1-r0 \
libstdc++=14.2.0-r11 \
libunwind-dev=1.8.3-r1 \
libuuid=2.41-r0 \
# TODO: Critic zaafiyet var diye commentlendi.
# CRITICAL CVE-2024-5535
# https://scout.docker.com/v/CVE-2024-5535
# openssl-config=3.3.0-r5 \
ncurses-dev=6.5_p20241228-r1 \
openssl=3.6.1-r0 \
openssl-dev=3.6.1-r0 \
openssl-doc=3.6.1-r0 \
tzdata=2025b-r0 \
wget=1.25.0-r1 \
zlib-dev=1.3.1-r6

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
