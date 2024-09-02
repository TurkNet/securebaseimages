FROM turknethub/tn-wolfios:0.0.2

ARG NEWRELICKEY=""
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true \
    NEW_RELIC_NO_CONFIG_FILE=true \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY \
    NEW_RELIC_LOG=stdout

ARG VERSION=19.9.0-r8
RUN apk update && apk add --no-cache icu=74.2-r2 icu-dev=74.2-r2 && \
    apk update && apk add --no-cache npm=10.8.2-r0 nodejs-19=${VERSION}

CMD ["tail", "-f", "/dev/null"]
