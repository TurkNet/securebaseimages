FROM registry.turknet.net.tr/dockerproxy/ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Temel araçlar ve Java kurulumu
RUN apt-get update && apt-get install -y \
    ca-certificates \
    git \
    curl \
    jq \
    unzip \
    tar \
    gettext \
    sudo \
    gnupg \
    openssl \
    wget \
    lsb-release \
    openjdk-17-jre \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Docker CLI ve Buildx kurulumu
RUN mkdir -m 0755 -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update && apt-get install -y docker-ce-cli docker-buildx-plugin \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Trivy kurulumu
RUN curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.70.0

# Consul kurulumu
RUN curl -fsSL https://releases.hashicorp.com/consul/1.20.1/consul_1.20.1_linux_amd64.zip -o consul.zip && \
    unzip -o consul.zip && \
    mv consul /usr/local/bin/ && \
    rm consul.zip

# Consul Template kurulumu
RUN curl -fsSL https://releases.hashicorp.com/consul-template/0.39.1/consul-template_0.39.1_linux_amd64.zip -o consul-template.zip && \
    unzip -o consul-template.zip && \
    mv consul-template /usr/local/bin/ && \
    rm consul-template.zip

# Openshift CLI (oc) ve kubectl kurulumu
RUN curl -L -o /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz && \
    tar -xvf /tmp/oc.tar.gz -C /usr/local/bin/ oc kubectl && \
    chmod +x /usr/local/bin/oc && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /tmp/oc.tar.gz

# Ortam değişkenleri
ENV PATH="$PATH:/usr/lib/jvm/java-17-openjdk-amd64/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV TRIVY_DB_REPOSITORY="ghcr.io/aquasecurity/trivy-db"
ENV CONSUL_HTTP_ADDR="xxx"
ENV CONSUL_HTTP_TOKEN="xxx"

# Consul Template yapılandırması
RUN mkdir /etc/consul-template.d/
COPY consul-template-prod.hcl /etc/consul-template.d/consul-template.hcl

CMD ["tail", "-f", "/dev/null"]