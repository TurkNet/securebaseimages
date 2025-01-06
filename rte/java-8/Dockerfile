FROM turknethub/tn-wolfios:0.0.4-78 AS newrelic

ARG NewRelicVersion=8.14.0
ARG NewRelicHome=/usr/local/tomcat/newrelic
ARG NEWRELICKEY=""
ENV CORECLR_NEWRELIC_HOME=$NewRelicHome \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY \
    NEW_RELIC_LOG_FILE_NAME=STDOUT \
    JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -javaagent:${NewRelicHome}/newrelic-agent-$NewRelicVersion.jar"

ARG NewRelicFile=newrelic-agent-${NewRelicVersion}.jar
ARG NewRelicUrl=https://download.newrelic.com/newrelic/java-agent/newrelic-agent/$NewRelicVersion/$NewRelicFile

RUN mkdir -p "${NewRelicHome}" && cd ${NewRelicHome} && \
    wget "${NewRelicUrl}"

FROM newrelic AS rte

COPY version /tmp/version

RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-8-jre=$(cat /tmp/version)

ENV PATH="/usr/lib/jvm/java-1.8-openjdk/bin:$PATH"

CMD ["tail", "-f", "/dev/null"]
