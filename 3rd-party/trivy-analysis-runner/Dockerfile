FROM turknethub/tn-wolfios:0.0.4-78

RUN apk update && apk add --no-cache \
    openjdk-17-jre=17.0.14-r2 \
    git \
    jq \
    sudo \
    docker-cli

RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.58.0

RUN mkdir -p /data/trivy

ENV PATH="$PATH:/usr/lib/jvm/java-17-openjdk/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

ENV TRIVY_DB_REPOSITORY="ghcr.io/aquasecurity/trivy-db"

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