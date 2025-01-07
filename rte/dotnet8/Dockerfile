FROM turknethub/tn-wolfios:0.0.4-78 AS newrelic

ARG TARGETARCH
ARG NewRelicVersion=10.29.0
ARG NewRelicHome=/usr/local/newrelic-dotnet-agent
ARG NEWRELICKEY=""
ENV CORECLR_ENABLE_PROFILING=1 \
    CORECLR_PROFILER={36032161-FFC0-4B61-B559-F6C5D41BAE5A} \
    CORECLR_NEWRELIC_HOME=$NewRelicHome \
    CORECLR_PROFILER_PATH=$NewRelicHome/libNewRelicProfiler.so \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY \
    NEW_RELIC_APPLICATION_LOGGING_ENABLED=false \
    NEW_RELIC_APPLICATION_LOGGING_METRICS_ENABLED=false \
    NEW_RELIC_APPLICATION_LOGGING_METRICS_ENABLED=false
    

ARG NewRelicFile=newrelic-dotnet-agent_${TARGETARCH}.tar.gz
ARG NewRelicUrl=https://download.newrelic.com/dot_net_agent/previous_releases/$NewRelicVersion/$NewRelicFile


RUN mkdir "${NewRelicHome}" && \
    cd /usr/local && wget -O - "${NewRelicUrl}" | gzip -dc | tar xf -

FROM newrelic AS dotnetrte

COPY version /tmp/version

RUN apk update && apk add --no-cache dotnet-8=$(cat /tmp/version) dotnet-8-runtime=$(cat /tmp/version) aspnet-8-runtime=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]


