FROM turknethub/java-11-sdk:11.0.24-r0-10 AS build

COPY version /tmp/version

# Install dependencies
RUN apk update && apk --no-cache --update add \
    curl=8.9.1-r3 \
    chromium=$(cat /tmp/version) \
    git=2.46.0-r2 \
    libsrt=1.5.3-r1 \
    python-3.12=3.12.5-r3



# Add Chrome as a user
RUN mkdir -p /usr/src/app \
    && adduser -D chrome \
    && chown -R chrome:chrome /usr/src/app

# Run Chrome as non-privileged
USER chrome
WORKDIR /usr/src/app


ENV CHROME_BIN=/usr/bin/chromium-browser \
    CHROME_PATH=/usr/lib/chromium/

# Autorun chrome headless
ENV CHROMIUM_FLAGS="--disable-software-rasterizer --disable-dev-shm-usage --headless"
ENTRYPOINT ["chromium-browser", "--headless"]
