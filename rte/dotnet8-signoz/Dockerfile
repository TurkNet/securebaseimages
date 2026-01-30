FROM turknethub/tn-wolfios:0.0.6-169 AS otel

RUN apk add --no-cache \
    curl \
    bash \
    icu-data-full \
    icu-libs
    
ENV OTEL_DOTNET_AUTO_HOME=/usr/local/otel-dotnet-auto

RUN rm -rf /usr/local/otel-dotnet-auto && \
    apk add --no-cache curl unzip && \
    curl -sSfL https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/download/v1.13.0/opentelemetry-dotnet-instrumentation-linux-glibc-x64.zip \
      -o /tmp/otel.zip && \
    unzip -d /usr/local/otel-dotnet-auto /tmp/otel.zip && \
    rm -f /tmp/otel.zip && \
    chmod -R a+rX /usr/local/otel-dotnet-auto && \
    chmod +x /usr/local/otel-dotnet-auto/linux-x64/OpenTelemetry.AutoInstrumentation.Native.so
    

RUN chmod +x /usr/local/otel-dotnet-auto/linux-x64/OpenTelemetry.AutoInstrumentation.Native.so && \
    chmod -R a+rX /usr/local/otel-dotnet-auto

ENV CORECLR_ENABLE_PROFILING=1 \
    CORECLR_PROFILER="{918728DD-259F-4A6A-AC2B-B85E1B658318}" \
    CORECLR_PROFILER_PATH="/usr/local/otel-dotnet-auto/linux-x64/OpenTelemetry.AutoInstrumentation.Native.so" \
    DOTNET_STARTUP_HOOKS="/usr/local/otel-dotnet-auto/net/OpenTelemetry.AutoInstrumentation.StartupHook.dll" \
    DOTNET_ADDITIONAL_DEPS="/usr/local/otel-dotnet-auto/AdditionalDeps" \
    DOTNET_SHARED_STORE="/usr/local/otel-dotnet-auto/store" \
    OTEL_DOTNET_AUTO_HOME="/usr/local/otel-dotnet-auto"

ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://signoz-otel-collector.devops.svc:4318" \
    OTEL_TRACES_EXPORTER=otlp \
    OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf \
    OTEL_EXPORTER_OTLP_INSECURE=true \
    OTEL_DOTNET_AUTO_LOG_DIRECTORY=/tmp/otel-dotnet-auto-logs

FROM otel AS dotnetrte

COPY version /tmp/version

RUN apk update && apk add --no-cache dotnet-8=$(cat /tmp/version) dotnet-8-runtime=$(cat /tmp/version) aspnet-8-runtime=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]