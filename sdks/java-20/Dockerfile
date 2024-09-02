FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=20.0.2.9-r4
RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-20-default-jdk=${VERSION}

CMD ["tail", "-f", "/dev/null"]
