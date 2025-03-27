FROM turknethub/tn-wolfios:0.0.4-98 AS newrelic

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

RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh && \
chmod +x ./dotnet-install.sh

RUN echo "Installing dotnet SDK Version = $(cat /tmp/version)" && \
./dotnet-install.sh --version $(cat /tmp/version) --install-dir /dotnet --architecture ${TARGETARCH}

RUN rm -f ./dotnet-install.sh

CMD ["tail", "-f", "/dev/null"]