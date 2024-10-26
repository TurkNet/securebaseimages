FROM turknethub/tn-wolfios:0.0.4-56

COPY version /tmp/version

RUN apk update && apk add --no-cache python-3.11=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]
