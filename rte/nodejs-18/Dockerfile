FROM turknethub/tn-wolfios:0.0.6-234

ARG NEWRELICKEY=""
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true \
    NEW_RELIC_NO_CONFIG_FILE=false \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=78.3-r1 icu-dev=78.3-r1 && \
    apk update && apk add --no-cache npm=12.0.2-r0 yarn=1.22.22-r8 nodejs-18=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]