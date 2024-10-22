FROM turknethub/tn-wolfios:0.0.4-53

ARG NEWRELICKEY=""
ENV NEW_RELIC_LICENSE_KEY=$NEWRELICKEY

COPY version /tmp/version

RUN apk update && apk add --no-cache python-3.10=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]
