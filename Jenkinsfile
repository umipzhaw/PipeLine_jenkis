pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                sh 'echo checkout'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/umipzhaw/DevOpsDemo']])
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
    post {
        always {
            script {
                def gradleVersion = sh(script: 'gradle --version | grep Gradle', returnStdout: true).trim()
                echo "Gradle-Version: ${gradleVersion}"
            }
        }
    }
}
