FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=6.0.133-r0
RUN apk update && apk add --no-cache dotnet-6=${VERSION} dotnet-6-sdk=${VERSION}

CMD ["tail", "-f", "/dev/null"]
