FROM turknethub/tn-wolfios:0.0.6-169


COPY version /tmp/version

RUN apk update && apk add --no-cache python-3.13=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]