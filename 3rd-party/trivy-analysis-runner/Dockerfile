FROM turknethub/tn-wolfios:0.0.6-169

RUN apk update && apk upgrade && apk add --no-cache \
    openjdk-17-jre \
    git \
    jq \
    sudo \
    docker-cli

RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.70.0

RUN mkdir -p /data/trivy

ENV PATH="$PATH:/usr/lib/jvm/java-17-openjdk/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

ENV TRIVY_DB_REPOSITORY="ghcr.io/aquasecurity/trivy-db"

CMD ["tail", "-f", "/dev/null"]