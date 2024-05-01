pipeline {
    agent any

    tools {
        // Stellen Sie sicher, dass Gradle korrekt konfiguriert ist in den globalen Jenkins-Tools
        gradle 2.11 // Ersetzen Sie 'Gradle_Version' mit dem Namen der Gradle-Version, die in Ihren Jenkins-Tools konfiguriert ist
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
                    // Nutzt den Gradle Wrapper im Projekt, um Build und Tests auszuführen
                    sh './gradlew clean build'
                }
            }
        }

        stage('Publish Reports') {
            steps {
                // Pfad zum Jacoco Report entsprechend anpassen, wenn notwendig
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

