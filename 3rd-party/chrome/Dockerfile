FROM ubuntu:22.04

WORKDIR /tmp

COPY version /tmp/version

RUN apt update && apt clean

RUN apt install -y \
wget=1.21.2-2ubuntu1.1 \
unzip=6.0-26ubuntu3.2 \
gnupg=2.2.27-3ubuntu2.1

# Set up the Chrome PPA
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

# Update the package list and install chrome
RUN apt update -y
RUN apt install -y google-chrome-stable=$(cat /tmp/version) libgconf-2-4=3.2.6-7ubuntu2

# Set up Chromedriver Environment variables
ENV CHROMEDRIVER_VERSION 128.0.6613.137
ENV CHROMEDRIVER_DIR /chromedriver
RUN mkdir $CHROMEDRIVER_DIR

# Download and install Chromedriver
RUN wget -q --continue -P $CHROMEDRIVER_DIR "https://storage.googleapis.com/chrome-for-testing-public/$CHROMEDRIVER_VERSION/linux64/chromedriver-linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR

# install java dependecies
RUN apt install -y \
openjdk-11-jre=11.0.24+8-1ubuntu3~22.04 \
maven=3.6.3-5

# Put Chromedriver into the PATH
ENV PATH $CHROMEDRIVER_DIR:$PATH

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "sleep", "infinity" ]
