pipeline {
    agent any

    tools {
        gradle 'Gradle_2.9'
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
                    sh './gradlew clean build'
                }
            }
        }

        stage('Publish Reports') {
            steps {
                jacoco(
                    execPattern: '**/build/jacoco/test.exec',
                    classPattern: '**/build/classes/java/main',
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

