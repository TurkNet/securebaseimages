FROM registry.turknet.net.tr/dockerproxy/ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y sudo

RUN apt-get update && apt-get install -y \
    ca-certificates \
    git \
    curl \
    jq \
    unzip \
    gettext \
    sudo \
    gnupg \
    openssl \
    wget \
    openjdk-17-jre \
    docker.io

# Trivy kurulumu
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.58.0

# Consul kurulumu
RUN curl -fsSL https://releases.hashicorp.com/consul/1.16.0/consul_1.16.0_linux_amd64.zip -o consul.zip && \
    unzip consul.zip && \
    mv consul /usr/local/bin/ && \
    rm consul.zip

RUN curl -fsSL https://releases.hashicorp.com/consul-template/0.33.0/consul-template_0.33.0_linux_amd64.zip -o consul-template.zip && \
    unzip consul-template.zip && \
    mv consul-template /usr/local/bin/ && \
    rm consul-template.zip

RUN curl -L -o /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz && \
    tar -xvf /tmp/oc.tar.gz -C /usr/local/bin/ oc kubectl && \
    chmod +x /usr/local/bin/oc && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /tmp/oc.tar.gz

ENV PATH="$PATH:/usr/lib/jvm/java-17-openjdk/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV TRIVY_DB_REPOSITORY="ghcr.io/aquasecurity/trivy-db"
ENV CONSUL_HTTP_ADDR="xxx"
ENV CONSUL_HTTP_TOKEN="xxx"

RUN mkdir /etc/consul-template.d/
COPY consul-template-prod.hcl /etc/consul-template.d/consul-template.hcl

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