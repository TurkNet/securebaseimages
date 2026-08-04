# Resmi ZAP imajını baz al (Debian tabanlı, tüm Java/ZAP/Python bağımlılıkları hazır)
FROM ghcr.io/zaproxy/zaproxy:stable

# Kurulum yapabilmek için geçici olarak root'a geç
USER root

# Gerekli araçları kur
RUN apt-get update && apt-get install -y --no-install-recommends \
    jq \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# OC CLI kurulumu
RUN curl -L -o /tmp/oc.tar.gz https://mirror.openshift.com/pub/openshift-v4/clients/ocp/stable/openshift-client-linux.tar.gz && \
    tar -xvf /tmp/oc.tar.gz -C /usr/local/bin/ oc kubectl && \
    chmod +x /usr/local/bin/oc && \
    chmod +x /usr/local/bin/kubectl && \
    rm -rf /tmp/oc.tar.gz

# OpenShift uyumluluğu ve CI/CD pipeline izin hatalarını çözmek için:
# Resmi ZAP imajındaki zap kullanıcısı UID 1000'dir.
# OpenShift'in rastgele atadığı UIDs (Root grubunda) dizinlere yazabilsin diye chgrp 0 ve chmod yapıyoruz.

RUN mkdir -p /zap/wrk && \
    chown -R zap:root /zap /home/zap && \
    chmod -R g=u /zap /home/zap

CMD ["tail", "-f", "/dev/null"]