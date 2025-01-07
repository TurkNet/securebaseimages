FROM turknethub/tn-wolfios:0.0.4-78

COPY version /tmp/version

RUN apk update && apk add --no-cache python-3.10=$(cat /tmp/version)
RUN apk update && apk add --no-cache py3-pip

CMD ["tail", "-f", "/dev/null"]
