FROM turknethub/tn-wolfios:0.0.5-114

ARG NEWRELICKEY=""
ENV NEW_RELIC_DISTRIBUTED_TRACING_ENABLED=true \
    NEW_RELIC_NO_CONFIG_FILE=false \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY 

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=75.1-r42 icu-dev=75.1-r8 && \
    apk update && apk add npm=10.8.2-r0 yarn=1.22.22-r1 nodejs-20=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]