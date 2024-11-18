FROM turknethub/tn-wolfios:0.0.4-70

COPY version /tmp/version

RUN apk update && apk add --no-cache python-3.12=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]
