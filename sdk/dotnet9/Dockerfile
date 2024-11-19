FROM turknethub/tn-wolfios:0.0.4-70 AS newrelic

ARG TARGETARCH
ARG NewRelicVersion=10.29.0
ARG NewRelicHome=/usr/local/newrelic-dotnet-agent
ARG NEWRELICKEY=""
ENV CORECLR_ENABLE_PROFILING=1 \
    CORECLR_PROFILER={36032161-FFC0-4B61-B559-F6C5D41BAE5A} \
    CORECLR_NEWRELIC_HOME=$NewRelicHome \
    CORECLR_PROFILER_PATH=$NewRelicHome/libNewRelicProfiler.so \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY \
    NEW_RELIC_APPLICATION_LOGGING_ENABLED=true \
    NEW_RELIC_APPLICATION_LOGGING_METRICS_ENABLED=true \
    NEW_RELIC_APPLICATION_LOGGING_FORWARDING_ENABLED=true

ARG NewRelicFile=newrelic-dotnet-agent_${TARGETARCH}.tar.gz
ARG NewRelicUrl=https://download.newrelic.com/dot_net_agent/previous_releases/$NewRelicVersion/$NewRelicFile


RUN mkdir "${NewRelicHome}" && \
    cd /usr/local && wget -O - "${NewRelicUrl}" | gzip -dc | tar xf -

FROM newrelic AS dotnetrte

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