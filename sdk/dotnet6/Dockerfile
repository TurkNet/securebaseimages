FROM turknethub/tn-wolfios:0.0.4-78

COPY version /tmp/version

RUN apk update && apk add --no-cache dotnet-6=$(cat /tmp/version) dotnet-6-sdk=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]