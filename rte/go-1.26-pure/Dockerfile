FROM turknethub/tn-wolfios:0.0.6-169

COPY version /tmp/version

RUN apk update && apk add --no-cache go-1.26=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]
