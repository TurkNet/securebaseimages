FROM turknethub/tn-wolfios:0.0.2

COPY version /tmp/version

RUN apk update && apk add --no-cache python-3.10=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]
