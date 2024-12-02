FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    apt-transport-https \
    software-properties-common && \
    rm -rf /var/lib/apt/lists/*

    
RUN wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && \
    dpkg -i packages-microsoft-prod.deb && \
    rm packages-microsoft-prod.deb

RUN apt-get update && \
    apt-get install -y dotnet-sdk-5.0 && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

CMD ["tail", "-f", "/dev/null"]