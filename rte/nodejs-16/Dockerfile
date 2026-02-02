FROM turknethub/tn-wolfios:0.0.6-169

ARG NEWRELICKEY=""
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true \
    NEW_RELIC_NO_CONFIG_FILE=false \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=75.1-r42 icu-dev=75.1-r8 && \
    apk update && apk add --no-cache npm=11.8.0-r0 yarn=1.22.22-r2 nodejs-16=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]