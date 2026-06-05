FROM turknethub/tn-wolfios:0.0.6-169 AS dotnetrte

COPY version /tmp/version

RUN mkdir /dotnet
ENV PATH /dotnet:$PATH

WORKDIR /dotnet

# Enable globalization and time zones
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

RUN mkdir -p /dotnet/datadog-source \
    && wget -O /tmp/datadog-dotnet-apm.tar.gz https://github.com/DataDog/dd-trace-dotnet/releases/latest/download/datadog-dotnet-apm.tar.gz \
    && tar -xzf /tmp/datadog-dotnet-apm.tar.gz -C /dotnet/datadog-source \
    && rm /tmp/datadog-dotnet-apm.tar.gz


CMD ["tail", "-f", "/dev/null"]