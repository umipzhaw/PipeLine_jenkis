pipeline {
    agent any
    tools {
    }
    stages {
        stage('Preparation') {
            steps {
                cleanWs()
                git url: 'https://github.com/umipzhaw/DevOpsDemo.git', branch: 'main'
            }
        }
        stage('Build and Test') {
            steps {
                script {
                    sh './gradlew clean test jacocoTestReport'
                }
            }
        }
        stage('Publish Jacoco Report') {
            steps {
                jacoco(
                    execPattern: '**/target/jacoco.exec',
                    classPattern: '**/classes',
                    sourcePattern: '**/src/main/java',
                    changeBuildStatus: false
                )
            }
        }
    }
    post {
        always {
            echo 'Cleaning up workspace'
            cleanWs()
        }
    }
}
