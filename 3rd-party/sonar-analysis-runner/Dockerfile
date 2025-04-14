FROM turknethub/tn-wolfios:0.0.4-78

RUN apk update && apk add --no-cache \
    ca-certificates \
    dotnet-9 \
    dotnet-9-sdk \
    openjdk-17-jre=17.0.14-r2 \
    maven-3.8=3.8.8-r0 \
    npm=10.8.2-r0 \
    yarn=1.22.22-r1 \
    nodejs-22=22.7.0-r0 \
    git \
    unzip \
    zip

ENV DOTNET_ROOT=/usr/share/dotnet

RUN curl -sSL https://dot.net/v1/dotnet-install.sh -o /tmp/dotnet-install.sh && \
    chmod +x /tmp/dotnet-install.sh

RUN /tmp/dotnet-install.sh --channel 8.0 --install-dir $DOTNET_ROOT
RUN /tmp/dotnet-install.sh --channel 7.0 --install-dir $DOTNET_ROOT
RUN /tmp/dotnet-install.sh --channel 6.0 --install-dir $DOTNET_ROOT

RUN rm /tmp/dotnet-install.sh

RUN dotnet tool install --global dotnet-sonarscanner
RUN dotnet tool install --global dotnet-reportgenerator-globaltool
RUN dotnet tool install --global coverlet.console

RUN curl -L -o sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-7.0.2.4839-linux-aarch64.zip && \
    unzip sonar-scanner.zip -d /opt && \
    mv /opt/sonar-scanner-7.0.2.4839-linux-aarch64 /opt/sonar-scanner && \
    rm sonar-scanner.zip && \
    mkdir /usr/local/bin/ && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

ENV PATH="$PATH:/root/.dotnet/tools:/usr/lib/jvm/java-17-openjdk/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

CMD ["tail", "-f", "/dev/null"]