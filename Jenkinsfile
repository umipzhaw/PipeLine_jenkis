pipeline {
    agent {
        docker { image 'mein-jenkins-gradle:latest' }
    }
    stages {
        stage('Checkout') {
            steps {
                sh 'echo "Checking out..."'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/umipzhaw/DevOpsDemo']])
            }
        }
        stage('Build') {
            steps {
                sh 'gradle build'
            }
        }
        stage('Test') {
            steps {
                sh 'echo "Running tests..."'
                sh 'gradle test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo "Deploying application..."'
            }
        }
    }
}
