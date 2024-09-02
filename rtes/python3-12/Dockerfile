FROM turknethub/tn-wolfios:0.0.2

ARG NEWRELICKEY=""
ENV NEW_RELIC_LICENSE_KEY=$NEWRELICKEY

ARG VERSION=3.12.5-r2
RUN apk update && apk add --no-cache python-3.12=${VERSION}

CMD ["tail", "-f", "/dev/null"]
