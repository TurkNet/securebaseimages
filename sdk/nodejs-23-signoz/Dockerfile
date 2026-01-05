FROM turknethub/tn-wolfios:0.0.4-98

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=75.1-r8 icu-dev=75.1-r8 && \
    apk update && apk add npm=11.7.0-r0 yarn=1.22.22-r2 nodejs-23=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]