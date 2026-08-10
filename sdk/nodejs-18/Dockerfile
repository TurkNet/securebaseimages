FROM turknethub/tn-wolfios:0.0.6-234

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=78.3-r1 icu-dev=78.3-r1 && \
    apk update && apk add --no-cache npm=11.12.1-r3 yarn=1.22.22-r8 nodejs-18=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]