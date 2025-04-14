FROM turknethub/tn-wolfios:0.0.4-78

RUN apk update && apk add --no-cache \
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

RUN curl -L -o dependency-check.zip https://github.com/jeremylong/DependencyCheck/releases/download/v12.1.0/dependency-check-12.1.0-release.zip && \
    unzip dependency-check.zip -d /opt && \
    rm dependency-check.zip && \
    mkdir /usr/local/bin/ && \
    ln -s /opt/dependency-check/bin/dependency-check.sh /usr/local/bin/dependency-check

ENV PATH="$PATH:/root/.dotnet/tools:/usr/lib/jvm/java-17-openjdk/bin"
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk
ENV DEPENDENCY_CHECK_NVD_API_KEY="xxx"

VOLUME /opt/dependency-check/data

CMD ["tail", "-f", "/dev/null"]