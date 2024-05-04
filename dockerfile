FROM jenkins/jenkins:lts
USER root

# Installiere notwendige Tools
RUN apt-get update && apt-get install -y curl unzip

# Installiere Gradle
RUN curl -L "https://services.gradle.org/distributions/gradle-7.4.2-bin.zip" -o gradle.zip \
    && unzip gradle.zip -d /opt \
    && ln -s /opt/gradle-7.4.2/bin/gradle /usr/bin/gradle \
    && rm gradle.zip

# Setze Umgebungsvariablen für Gradle
ENV GRADLE_HOME=/opt/gradle-7.4.2
ENV PATH=$PATH:$GRADLE_HOME/bin

USER jenkins
