FROM turknethub/tn-wolfios:0.0.5-114

COPY version /tmp/version

RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-17-default-jdk=$(cat /tmp/version)

ENV PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

CMD ["tail", "-f", "/dev/null"]
