FROM turknethub/tn-wolfios:0.0.2

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=74.2-r2 icu-dev=74.2-r2 && \
    apk update && apk add npm=10.8.2-r0 nodejs-21=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]
