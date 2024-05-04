pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                sh 'echo checkout'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/umipzhaw/DevOpsDemo']])
            }
        }
        stage('Setup Gradle') {
            steps {
                script {
                    // Installiert Gradle, wenn es nicht vorhanden ist
                    sh '''
                    if ! type "gradle" > /dev/null; then
                      echo "Installing Gradle"
                      wget https://services.gradle.org/distributions/gradle-7.4.2-bin.zip
                      unzip gradle-7.4.2-bin.zip -d /opt
                      export PATH=$PATH:/opt/gradle-7.4.2/bin
                    fi
                    gradle --version
                    '''
                }
            }
        }
        stage('Build') {
            steps {
                script {
                    // Verwendet Gradle für den Build-Prozess
                    sh 'gradle build'
                }
            }
        }
        stage('Test') {
            steps {
                sh 'echo test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploy'
            }
        }
    }
}
