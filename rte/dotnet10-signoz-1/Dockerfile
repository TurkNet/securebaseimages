FROM turknethub/tn-wolfios:0.0.5-114 AS otel

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

RUN mkdir /dotnet
ENV PATH=/dotnet:$PATH
WORKDIR /dotnet

ENV DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

RUN apk add --no-cache \
    icu-data-full \
    icu-libs

# --------------------------------------------------
# IronPDF (Chromium) runtime dependencies (Wolfi)
# --------------------------------------------------
RUN set -eux; \
    # Core libs (must-have)
    apk add --no-cache \
      fontconfig \
      freetype \
      harfbuzz \
      icu \
      nss \
      cups-libs \
      libx11 \
      libxcomposite \
      libxdamage \
      libxext \
      libxfixes \
      libxrandr \
      libxcb \
      libdrm \
      zlib \
      libssl3 \
      libcrypto3 \
      libgdiplus \
    ; \
    \
    # glibc-utils (optional: may not exist in this repo)
    (apk add --no-cache glibc-utils) || echo "INFO: glibc-utils not available in this repo; continuing"; \
    \
    # Fonts (Wolfi package names differ)
    (apk add --no-cache font-noto) \
      || (apk add --no-cache ttf-opensans) \
      || (apk add --no-cache ttf-dejavu) \
      || (echo "ERROR: No suitable font package found (font-noto/ttf-opensans/ttf-dejavu)" && exit 1) \
    ; \
    \
    # libgbm provider (Wolfi package names differ)
    (apk add --no-cache mesa-gbm) \
      || (apk add --no-cache gbm) \
      || (apk add --no-cache mesa) \
      || (echo "ERROR: No GBM provider found (mesa-gbm/gbm/mesa). Chromium will not run." && exit 1)

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && chmod +x ./dotnet-install.sh \
    && ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --runtime dotnet \
    && ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --runtime aspnetcore \
    && rm -f ./dotnet-install.sh

CMD ["tail", "-f", "/dev/null"]
