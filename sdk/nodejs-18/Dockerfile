FROM turknethub/tn-wolfios:0.0.5-114

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=75.1-r42 icu-dev=75.1-r8 && \
    apk update && apk add --no-cache npm=10.9.2-r0 yarn=1.22.22-r1 nodejs-18=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]