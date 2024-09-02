FROM turknethub/tn-wolfios:0.0.2

ARG VERSION=7.0.120-r0
RUN apk update && apk add --no-cache dotnet-7=${VERSION} dotnet-7-sdk=${VERSION}

CMD ["tail", "-f", "/dev/null"]

