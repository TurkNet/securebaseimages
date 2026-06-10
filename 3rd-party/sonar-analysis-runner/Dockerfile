FROM turknethub/tn-wolfios:0.0.6-169

RUN apk update && apk upgrade && apk add --no-cache \
    ca-certificates \
    dotnet-10 \
    openjdk-17-jre \
    maven-3.9 \
    npm \
    yarn \
    nodejs-22 \
    jq=1.7.1-r6 \
    git \
    unzip \
    zip

ENV DOTNET_ROOT=/usr/share/dotnet

RUN curl -sSL https://dot.net/v1/dotnet-install.sh -o /tmp/dotnet-install.sh && \
    chmod +x /tmp/dotnet-install.sh

RUN /tmp/dotnet-install.sh --channel 10.0 --install-dir $DOTNET_ROOT
RUN /tmp/dotnet-install.sh --channel 9.0 --install-dir $DOTNET_ROOT
RUN /tmp/dotnet-install.sh --channel 8.0 --install-dir $DOTNET_ROOT
RUN /tmp/dotnet-install.sh --channel 7.0 --install-dir $DOTNET_ROOT
RUN /tmp/dotnet-install.sh --channel 6.0 --install-dir $DOTNET_ROOT

RUN rm /tmp/dotnet-install.sh

RUN dotnet tool install --global dotnet-sonarscanner
RUN dotnet tool install --global dotnet-reportgenerator-globaltool
RUN dotnet tool install --global coverlet.console

RUN curl -L -o sonar-scanner.zip https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-8.1.0.6389-linux-x64.zip && \
    unzip sonar-scanner.zip -d /opt && \
    mv /opt/sonar-scanner-8.1.0.6389-linux-x64 /opt/sonar-scanner && \
    rm sonar-scanner.zip && \
    mkdir /usr/local/bin/ && \
    ln -s /opt/sonar-scanner/bin/sonar-scanner /usr/local/bin/sonar-scanner

RUN rm -f /opt/sonar-scanner/jre/bin/java && \
    ln -s /usr/lib/jvm/java-17-openjdk/bin/java /opt/sonar-scanner/jre/bin/java

ENV PATH="$PATH:/root/.dotnet/tools:/usr/lib/jvm/java-17-openjdk/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk

CMD ["tail", "-f", "/dev/null"]