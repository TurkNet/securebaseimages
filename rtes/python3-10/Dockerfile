FROM turknethub/tn-wolfios:0.0.2

ARG NEWRELICKEY=""
ENV NEW_RELIC_LICENSE_KEY=$NEWRELICKEY

ARG VERSION=3.10.14-r6
RUN apk update && apk add --no-cache python-3.10=${VERSION}

CMD ["tail", "-f", "/dev/null"]
