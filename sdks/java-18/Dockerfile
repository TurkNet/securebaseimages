FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=18.0.2.1.0-r5
RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-18-default-jdk=${VERSION}

CMD ["tail", "-f", "/dev/null"]