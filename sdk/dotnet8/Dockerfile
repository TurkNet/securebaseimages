FROM turknethub/tn-wolfios:0.0.4-53

COPY version /tmp/version

RUN apk update && apk add --no-cache dotnet-8=$(cat /tmp/version) dotnet-8-sdk=$(cat /tmp/version)

RUN curl -L https://dist.nuget.org/win-x86-commandline/latest/nuget.exe -o /usr/local/bin/nuget && \
    chmod +x /usr/local/bin/nuget && \
    nuget update -self && \
    nuget locals all -clear

CMD ["tail", "-f", "/dev/null"]