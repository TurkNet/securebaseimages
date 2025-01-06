FROM turknethub/tn-wolfios:0.0.4-78

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=74.2-r2 icu-dev=74.2-r2 && \
    apk update && apk add --no-cache npm=10.8.2-r0 yarn=1.22.22-r1 nodejs-19=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]
