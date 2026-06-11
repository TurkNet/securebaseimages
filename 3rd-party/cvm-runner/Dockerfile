FROM turknethub/tn-wolfios:0.0.6-229

RUN apk update && apk upgrade && apk add --no-cache \
    jq \
    git \
    python3 \
    py3-pip

RUN pip3 install requests

CMD ["tail", "-f", "/dev/null"]