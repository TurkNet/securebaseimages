FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=22.0.2-r0
RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-22-default-jdk=${VERSION}

CMD ["tail", "-f", "/dev/null"]
