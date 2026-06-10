FROM turknethub/tn-wolfios:0.0.6-169

RUN apk update && apk upgrade && apk add --no-cache \
    openjdk-17-jre \
    git \
    docker-cli

RUN curl -L -o /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz && \
    mkdir /usr/local/bin/ && \
    tar -xvf /tmp/oc.tar.gz -C /usr/local/bin/ oc kubectl && \
    chmod +x /usr/local/bin/oc && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /tmp/oc.tar.gz

ENV PATH="$PATH:/usr/lib/jvm/java-17-openjdk/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

CMD ["tail", "-f", "/dev/null"]