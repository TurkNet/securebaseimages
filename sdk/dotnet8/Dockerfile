FROM turknethub/tn-wolfios:0.0.4-70

COPY version /tmp/version

RUN apk update && apk add --no-cache dotnet-8=$(cat /tmp/version) dotnet-8-sdk=$(cat /tmp/version)

CMD ["tail", "-f", "/dev/null"]