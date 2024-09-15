FROM turknethub/tn-wolfios:0.0.4-27

COPY version /tmp/version

RUN apk update && apk add maven-3.8=3.8.8-r0 openjdk-18-default-jdk=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]