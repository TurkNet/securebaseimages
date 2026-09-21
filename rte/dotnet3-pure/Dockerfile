FROM turknethub/tn-wolfios:0.0.6-234 AS  dotnetrte

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
    icu-data-full \
    icu-libs \
    krb5-libs \
    libgcc
RUN ARCH=$(uname -m) && \
    wget https://dl-cdn.alpinelinux.org/alpine/v3.16/main/${ARCH}/libssl1.1-1.1.1w-r1.apk -O /tmp/libssl.apk && \
    wget https://dl-cdn.alpinelinux.org/alpine/v3.16/main/${ARCH}/libcrypto1.1-1.1.1w-r1.apk -O /tmp/libcrypto.apk && \
    tar -xzf /tmp/libssl.apk -C /tmp && \
    tar -xzf /tmp/libcrypto.apk -C /tmp && \
    cp /tmp/lib/libssl.so.1.1 /usr/lib/ && \
    cp /tmp/lib/libcrypto.so.1.1 /usr/lib/ && \
    rm -rf /tmp/libssl.apk /tmp/libcrypto.apk /tmp/lib

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
    chmod +x ./dotnet-install.sh

RUN echo "Installing dotnet RTE Version = $(cat /tmp/version)" && \
    ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --runtime dotnet
RUN echo "Installing aspnetcore RTE Version = $(cat /tmp/version)" && \
    ./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --runtime aspnetcore

RUN rm -f ./dotnet-install.sh

CMD ["tail", "-f", "/dev/null"]