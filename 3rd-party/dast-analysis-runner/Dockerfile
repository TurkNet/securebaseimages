FROM turknethub/tn-wolfios:0.0.4-78

RUN apk update && apk add --no-cache \
    openjdk-17-jre=17.0.14-r2 \
    git \
    docker-cli

ENV OC_VERSION=stable-4.18
ENV OC_ARCH=linux-arm64

RUN curl -L -o /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz && \
    mkdir /usr/local/bin/ && \
    tar -xvf /tmp/oc.tar.gz -C /usr/local/bin/ oc kubectl && \
    chmod +x /usr/local/bin/oc && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /tmp/oc.tar.gz

ENV PATH="$PATH:/usr/lib/jvm/java-17-openjdk/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

VOLUME /var/run/docker.sock

ENV DOCKER_HOST="unix:///var/run/docker.sock"

RUN mkdir -p /etc/docker && \
    echo '{\n\
  "storage-driver": "vfs",\n\
  "hosts": ["unix:///var/run/docker.sock"],\n\
  "tls": false\n\
}' > /etc/docker/daemon.json

RUN mkdir -p /root/.docker && \
    echo '{"hosts": ["unix:///var/run/docker.sock"]}' > /root/.docker/config.json

CMD ["tail", "-f", "/dev/null"]