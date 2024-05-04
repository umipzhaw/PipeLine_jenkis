pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                sh 'echo checkout'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/umipzhaw/DevOpsDemo']])
            }
        }
        stage('Build') {
            steps {
                script {
                    sh 'gradle build'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'gradle test'
                }
            }
        }
        stage('Deploy') {
            steps {
                sh 'echo deploy'
            }
        }
    }
}
