FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=8.0.8-r0
RUN apk update && apk add --no-cache dotnet-8=${VERSION} dotnet-8-sdk=${VERSION}

CMD ["tail", "-f", "/dev/null"]