FROM turknethub/tn-wolfios:0.0.6-169

COPY version /tmp/version

RUN apk update && apk add --no-cache go-1.26=$(cat /tmp/version)
ENV GOPATH=/go
ENV PATH=$GOPATH/bin:/usr/local/go/bin:$PATH

RUN GODEBUG=http2client=0 go install github.com/DataDog/orchestrion@v1.11.0

CMD ["tail", "-f", "/dev/null"]
