FROM turknethub/tn-wolfios:0.0.5-114

RUN apk add --no-cache nodejs npm curl bash

RUN npm install -g \
    @opentelemetry/api \
    @opentelemetry/sdk-node \
    @opentelemetry/auto-instrumentations-node \
    @opentelemetry/exporter-trace-otlp-http && \
    chmod -R a+rX /usr/lib/node_modules

ENV NODE_OPTIONS="--require @opentelemetry/auto-instrumentations-node/register"

ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://signoz-otel-collector.devops.svc:4318 \
    OTEL_TRACES_EXPORTER=otlp \
    OTEL_METRICS_EXPORTER=otlp \
    OTEL_LOGS_EXPORTER=otlp \
    OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf \
    OTEL_EXPORTER_OTLP_INSECURE=true 

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=75.1-r42 icu-dev=75.1-r8 && \
    apk update && apk add npm=10.9.2-r0 yarn=1.22.22-r2 nodejs-22=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]