FROM turknethub/tn-wolfios:0.0.5-114 AS newrelic

ARG NewRelicVersion=8.14.0
ARG NewRelicHome=/usr/local/tomcat/newrelic
ARG NEWRELICKEY=""
ENV CORECLR_NEWRELIC_HOME=$NewRelicHome \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY \
    JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -javaagent:${NewRelicHome}/newrelic-agent-$NewRelicVersion.jar"

ARG NewRelicFile=newrelic-agent-${NewRelicVersion}.jar
ARG NewRelicUrl=https://download.newrelic.com/newrelic/java-agent/newrelic-agent/$NewRelicVersion/$NewRelicFile

RUN mkdir -p "${NewRelicHome}" && cd ${NewRelicHome} && \
    wget "${NewRelicUrl}"

FROM newrelic AS rte

COPY version /tmp/version

RUN apk update && apk add maven-4.0=4.0.0-rc-4 openjdk-17-jre=$(cat /tmp/version)

ENV PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

CMD ["tail", "-f", "/dev/null"]