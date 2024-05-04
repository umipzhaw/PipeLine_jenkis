FROM openjdk:21-jdk

# Installiere notwendige Tools
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    git

# Installiere Gradle
RUN curl -L https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -o gradle-7.4.2-bin.zip \
    && unzip gradle-7.4.2-bin.zip -d /opt \
    && ln -s /opt/gradle-7.4.2/bin/gradle /usr/bin/gradle

# Setze Umgebungsvariablen
ENV GRADLE_HOME=/opt/gradle-7.4.2
ENV PATH=$PATH:$GRADLE_HOME/bin

# Arbeitsverzeichnis definieren
WORKDIR /home/jenkins

# Standardbefehl definieren
CMD ["gradle"]
