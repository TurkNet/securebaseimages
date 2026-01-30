FROM turknethub/tn-wolfios:0.0.6-169 AS otel

ARG TARGETARCH

COPY version /tmp/version

RUN mkdir /dotnet
ENV PATH /dotnet:$PATH

WORKDIR /dotnet

# Enable globalization and time zones:
# https://github.com/dotnet/dotnet-docker/blob/main/samples/enable-globalization.md
ENV \
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=false \
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

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
chmod +x ./dotnet-install.sh

RUN echo "Installing dotnet SDK Version = $(cat /tmp/version)" && \
./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --architecture ${TARGETARCH}

RUN rm -f ./dotnet-install.sh

CMD ["tail", "-f", "/dev/null"]