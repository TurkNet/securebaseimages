FROM turknethub/tn-wolfios:0.0.5-114 AS otel

# OTEL kurulum bağımlılıkları
RUN apk add --no-cache curl bash icu-data-full icu-libs

# OpenTelemetry .NET Auto Instrumentation
RUN curl -sSfL https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/latest/download/otel-dotnet-auto-install.sh -O && \
    chmod +x otel-dotnet-auto-install.sh && \
    sh ./otel-dotnet-auto-install.sh

# OTEL injection için gerekli ENV değişkenleri
ENV CORECLR_ENABLE_PROFILING=1 \
    CORECLR_PROFILER="{918728DD-259F-4A6A-AC2B-4BB0579D3F96}" \
    CORECLR_PROFILER_PATH="/otel-dotnet-auto/linux-x64/OpenTelemetry.AutoInstrumentation.Native.so" \
    OTEL_DOTNET_AUTO_HOME="/otel-dotnet-auto" \
    DOTNET_STARTUP_HOOKS="/otel-dotnet-auto/net/OpenTelemetry.AutoInstrumentation.StartupHook.dll"

ENV OTEL_EXPORTER_OTLP_ENDPOINT=http://signoz-otel-collector.devops.svc:4317 \
    OTEL_TRACES_EXPORTER=otlp \
    OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf \
    OTEL_DOTNET_AUTO_LOG_DIRECTORY=/tmp/otel-dotnet-auto-logs \
    OTEL_EXPORTER_OTLP_INSECURE=true \
    OTEL_RESOURCE_ATTRIBUTES="service.version=1.0.0"

FROM otel AS dotnetrte

COPY version /tmp/version

RUN mkdir /dotnet
ENV PATH /dotnet:$PATH
WORKDIR /dotnet

# Globalization ayarları
ENV \
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

RUN apk add --no-cache \
    icu-data-full \
    icu-libs

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x ./dotnet-install.sh

RUN echo "Installing dotnet RTE Version = $(cat /tmp/version)" && \
    ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --runtime dotnet

RUN echo "Installing aspnetcore RTE Version = $(cat /tmp/version)" && \
    ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --runtime aspnetcore

RUN rm -f ./dotnet-install.sh

CMD ["tail", "-f", "/dev/null"]
