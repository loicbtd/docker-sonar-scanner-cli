FROM openjdk:8-alpine

LABEL maintainer="Loïc BERTRAND <loic.bert.marcel@gmail.com>"

ARG SONAR_SCANNER_CLI_SOURCE="https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-4.3.0.2102.zip"

ENV \
    PATH=/opt/sonar-scanner-cli/bin:$PATH \
    SONAR_RUNNER_HOME=/opt/sonar-scanner-cli \
    JAVA_HOME=/usr

RUN \
    echo "**** installing required packages" && \
        apk add --no-cache --upgrade \
            sed \
            curl && \
    echo "**** installing sonar-scanner-cli" && \
        mkdir -p /tmp/downloads /tmp/extracted && \
        curl -o /tmp/downloads/sonar-scanner-cli.zip $SONAR_SCANNER_CLI_SOURCE && \
        cd /tmp/extracted && \
        jar xf /tmp/downloads/sonar-scanner-cli.zip && \
        mv /tmp/extracted/sonar-scanner-* /opt/sonar-scanner-cli && \
        chmod -R +x /opt/sonar-scanner-cli/bin && \
    echo "**** cleaning up ****" && \
        rm -rf /tmp/*