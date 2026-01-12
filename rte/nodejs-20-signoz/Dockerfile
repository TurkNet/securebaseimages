FROM turknethub/tn-wolfios:0.0.5-114

COPY version /tmp/version

RUN apk update && apk add --no-cache icu=75.1-r42 icu-dev=75.1-r8 && \
    apk update && apk add npm=11.7.0-r0 yarn=1.22.22-r2 nodejs-20=$(cat /tmp/version)

ENV OTEL_NODE_HOME=/opt/otel-nodejs
WORKDIR $OTEL_NODE_HOME

RUN npm init -y && \
    npm install \
    @opentelemetry/api \
    @opentelemetry/sdk-node \
    @opentelemetry/auto-instrumentations-node \
    @opentelemetry/exporter-trace-otlp-http && \
    chmod -R a+rX /opt/otel-nodejs

ENV NODE_PATH=$OTEL_NODE_HOME/node_modules:$NODE_PATH

ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://signoz-otel-collector.devops.svc:4318 \
    OTEL_TRACES_EXPORTER=otlp \
    OTEL_METRICS_EXPORTER=otlp \
    OTEL_LOGS_EXPORTER=otlp \
    OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf \
    OTEL_EXPORTER_OTLP_INSECURE=true 

WORKDIR /app
CMD ["tail", "-f", "/dev/null"]