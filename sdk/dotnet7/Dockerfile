FROM turknethub/tn-wolfios:0.0.2

COPY version /tmp/version

RUN apk update && apk add --no-cache dotnet-7=$(cat /tmp/version) dotnet-7-sdk=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]

