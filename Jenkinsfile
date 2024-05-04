pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                sh 'echo checkout'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/umipzhaw/DevOpsDemo']])
            }
        }
        stage('Setup Tools') {
            steps {
                script {
                    sh '''
                    if ! type "curl" > /dev/null; then
                      echo "curl is not installed. Attempting to install..."
                      apt-get update && apt-get install -y curl
                    fi
                    if ! type "unzip" > /dev/null; then
                      echo "unzip is not installed. Attempting to install..."
                      apt-get update && apt-get install -y unzip
                    fi
                    '''
                }
            }
        }
        stage('Setup Gradle') {
            steps {
                script {
                    sh '''
                    if ! type "gradle" > /dev/null; then
                      echo "Installing Gradle"
                      curl -L https://services.gradle.org/distributions/gradle-7.4.2-bin.zip -o gradle-7.4.2-bin.zip
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
