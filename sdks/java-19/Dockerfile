FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=19.0.2.7-r5
RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-19-default-jdk=${VERSION}

CMD ["tail", "-f", "/dev/null"]
