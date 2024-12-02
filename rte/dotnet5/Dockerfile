FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

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

RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    apt-transport-https \
    software-properties-common && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb

RUN apt-get update && \
    apt-get install -y aspnetcore-runtime-5.0 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD ["dotnet", "--version"]