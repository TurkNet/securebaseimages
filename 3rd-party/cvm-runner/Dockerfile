FROM turknethub/tn-wolfios:0.0.6-169

RUN apk update && apk upgrade && apk add --no-cache \
    jq=1.7.1-r6 \
    git \
    python3 \
    py3-pip

RUN pip3 install requests

CMD ["tail", "-f", "/dev/null"]