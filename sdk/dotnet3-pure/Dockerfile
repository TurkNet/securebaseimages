FROM turknethub/tn-wolfios:0.0.6-234 AS dotnetrte

ARG TARGETARCH

COPY version /tmp/version

RUN mkdir /dotnet
ENV PATH /dotnet:$PATH

WORKDIR /dotnet

# Enable globalization and time zones:
# https://github.com/dotnet/dotnet-docker/blob/main/samples/enable-globalization.md
ENV \
    DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=true \
    LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8

RUN apk add --no-cache \
    binutils \
    icu-data-full \
    icu-libs \
    krb5-libs \
    libgcc \
    ca-certificates

# Wolfi OS glibc tabanlı olduğu için glibc ile derlenmiş libssl1.1 ve libcrypto1.1 gereklidir
RUN ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then \
    URL="http://security.ubuntu.com/ubuntu/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.24_amd64.deb"; \
    elif [ "$ARCH" = "aarch64" ]; then \
    URL="http://ports.ubuntu.com/pool/main/o/openssl/libssl1.1_1.1.1f-1ubuntu2.24_arm64.deb"; \
    fi && \
    cd /tmp && \
    wget -q "$URL" -O libssl1.1.deb && \
    ar -x libssl1.1.deb && \
    tar -xf data.tar.xz && \
    (cp usr/lib/*/*so.1.1 /usr/lib/ 2>/dev/null || cp usr/lib/*so.1.1 /usr/lib/ 2>/dev/null) && \
    rm -rf /tmp/libssl* /tmp/data.tar.xz /tmp/control.tar.xz /tmp/debian-binary /tmp/usr && \
    apk del binutils

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x ./dotnet-install.sh

RUN echo "Installing dotnet SDK Version = $(cat /tmp/version)" && \
    ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --architecture ${TARGETARCH}

RUN rm -f ./dotnet-install.sh

CMD ["tail", "-f", "/dev/null"]
