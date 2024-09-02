FROM turknethub/tn-wolfios:0.0.2 AS newrelic

ARG NewRelicVersion=8.14.0
ARG NewRelicHome=/usr/local/tomcat/newrelic
ARG NEWRELICKEY=""
ENV CORECLR_NEWRELIC_HOME=$NewRelicHome \
    NEW_RELIC_LICENSE_KEY=$NEWRELICKEY \
    NEW_RELIC_LOG_FILE_NAME=STDOUT \
    JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -javaagent:${NewRelicHome}/newrelic.jar"

ARG NewRelicFile=newrelic-agent-${NewRelicVersion}.jar
ARG NewRelicUrl=https://download.newrelic.com/newrelic/java-agent/newrelic-agent/$NewRelicVersion/$NewRelicFile

RUN mkdir -p "${NewRelicHome}" && cd ${NewRelicHome} && \
    wget "${NewRelicUrl}"

FROM newrelic AS rte

ARG VERSION=22.0.2-r0
RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-22-jre=${VERSION}

CMD ["tail", "-f", "/dev/null"]
