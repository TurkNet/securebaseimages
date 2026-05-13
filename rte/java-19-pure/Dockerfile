FROM turknethub/tn-wolfios:0.0.6-169 AS rte

COPY version /tmp/version

RUN apk update && apk add maven-3.9=3.9.12-r0 openjdk-19-jre=$(cat /tmp/version)

ENV PATH="/usr/lib/jvm/java-19-openjdk/bin:$PATH"

CMD ["tail", "-f", "/dev/null"]