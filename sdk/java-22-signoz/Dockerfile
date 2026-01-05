FROM turknethub/tn-wolfios:0.0.5-114

COPY version /tmp/version

RUN apk update && apk add maven-3.9=3.9.12-r0 openjdk-22-default-jdk=$(cat /tmp/version)

ENV PATH="/usr/lib/jvm/java-22-openjdk/bin:$PATH"

CMD ["tail", "-f", "/dev/null"]