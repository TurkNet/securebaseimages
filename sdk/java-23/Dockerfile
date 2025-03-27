FROM turknethub/tn-wolfios:0.0.4-98

COPY version /tmp/version

RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-23-default-jdk=$(cat /tmp/version)

ENV PATH="/usr/lib/jvm/java-23-openjdk/bin:$PATH"

CMD ["tail", "-f", "/dev/null"]