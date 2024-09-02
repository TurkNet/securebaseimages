FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=21.0.4-r1
RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-21-default-jdk=${VERSION}

CMD ["tail", "-f", "/dev/null"]
