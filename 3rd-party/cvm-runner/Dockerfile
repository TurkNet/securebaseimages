FROM turknethub/tn-wolfios:0.0.4-78

RUN apk update && apk add --no-cache \
    jq \
    git \
    python3 \
    py3-pip

RUN pip3 install requests

CMD ["tail", "-f", "/dev/null"]