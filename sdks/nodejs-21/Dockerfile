FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=21.7.3-r2
RUN apk update && apk add --no-cache icu=74.2-r2 icu-dev=74.2-r2 && \
    apk update && apk add npm=10.8.2-r0 nodejs-21=${VERSION}

CMD ["tail", "-f", "/dev/null"]
