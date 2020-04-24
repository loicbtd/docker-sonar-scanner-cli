FROM openjdk:8-alpine

ENV \
    SONAR_SCANNER_CLI_SOURCE="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.2.0.1873-linux.zip" \
    PATH=/opt/sonar-scanner-cli/bin:$PATH

RUN \
    echo "**** installing required packages" && \
        apk add --no-cache --upgrade \
            curl \
            unzip && \
    echo "**** installing sonar-scanner-cli" && \
        mkdir -p /tmp/downloads /opt/sonnar-scanner-cli && \
        curl -o /tmp/downloads/sonar-scanner-cli.zip $SONAR_SCANNER_CLI_SOURCE && \
        unzip /tmp/downloads/sonar-scanner-cli.zip -d /opt/sonnar-scanner-cli && \
    echo "**** cleaning up ****" && \
        rm -rf /tmp/*
