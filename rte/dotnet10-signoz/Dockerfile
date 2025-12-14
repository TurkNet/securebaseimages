FROM turknethub/tn-wolfios:0.0.5-114 AS otel

# Bağımlılıklar
RUN apk add --no-cache curl bash icu-data-full icu-libs

# OpenTelemetry .NET Auto Instrumentation kurulumu
RUN curl -sSfL https://github.com/open-telemetry/opentelemetry-dotnet-instrumentation/releases/latest/download/otel-dotnet-auto-install.sh -O \
    && chmod +x otel-dotnet-auto-install.sh \
    && sh ./otel-dotnet-auto-install.sh

# Kurulum pathi
ENV OTEL_DOTNET_AUTO_HOME="/root/.otel-dotnet-auto"

# appuser için okunabilir yap
RUN chmod -R a+rX /root/.otel-dotnet-auto

# Profiler & StartupHook
ENV CORECLR_ENABLE_PROFILING=1 \
    CORECLR_PROFILER="{918728DD-259F-4A6A-AC2B-4BB0579D3F96}" \
    CORECLR_PROFILER_PATH="/root/.otel-dotnet-auto/linux-x64/OpenTelemetry.AutoInstrumentation.Native.so" \
    DOTNET_STARTUP_HOOKS="/root/.otel-dotnet-auto/net/OpenTelemetry.AutoInstrumentation.StartupHook.dll"

# Exporter ayarları
ENV OTEL_EXPORTER_OTLP_ENDPOINT="http://signoz-otel-collector.devops.svc:4317" \
    OTEL_TRACES_EXPORTER=otlp \
    OTEL_EXPORTER_OTLP_PROTOCOL=http/protobuf \
    OTEL_EXPORTER_OTLP_INSECURE=true \
    OTEL_DOTNET_AUTO_LOG_DIRECTORY=/tmp/otel-dotnet-auto-logs

FROM otel AS dotnetrte

COPY version /tmp/version

RUN mkdir /dotnet
ENV PATH=/dotnet:$PATH
WORKDIR /dotnet

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

RUN apk add --no-cache icu-data-full icu-libs

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && chmod +x ./dotnet-install.sh \
    && ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --runtime dotnet \
    && ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --runtime aspnetcore \
    && rm -f ./dotnet-install.sh

CMD ["tail", "-f", "/dev/null"]
