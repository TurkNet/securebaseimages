FROM turknethub/tn-wolfios:0.0.6-169 AS otel

RUN apk add --no-cache \
    curl \
    bash \
    icu-data-full \
    icu-libs

ENV OTEL_JAVA_HOME=/usr/local/otel-java

RUN rm -rf $OTEL_JAVA_HOME && \
    mkdir -p $OTEL_JAVA_HOME && \
    curl -sSfL https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.10.0/opentelemetry-javaagent.jar \
      -o $OTEL_JAVA_HOME/opentelemetry-javaagent.jar && \
    chmod -R a+rX $OTEL_JAVA_HOME

ENV JAVA_TOOL_OPTIONS="-javaagent:/usr/local/otel-java/opentelemetry-javaagent.jar"

ENV OTEL_TRACES_EXPORTER=otlp \
    OTEL_METRICS_EXPORTER=otlp \
    OTEL_LOGS_EXPORTER=otlp \
    OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf \
    OTEL_EXPORTER_OTLP_ENDPOINT=http://signoz-otel-collector.devops.svc:4318 \
    OTEL_EXPORTER_OTLP_INSECURE=true

FROM otel AS javarte

COPY version /tmp/version

RUN apk update && apk add maven-3.9=3.9.12-r0 openjdk-23-jre=$(cat /tmp/version)

ENV PATH="/usr/lib/jvm/java-23-openjdk/bin:$PATH"

CMD ["tail", "-f", "/dev/null"]
