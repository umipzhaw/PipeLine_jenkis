pipeline {
    agent any
    tools {
        // Definiere Maven, wenn es in Jenkins konfiguriert ist. Stelle sicher, dass der Name mit dem in der Jenkins-Konfiguration übereinstimmt.
        maven 'Maven_3_6_3'
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
                    // Ändere auf Maven oder belasse es bei Gradle, abhängig von deinem Projektsetup
                    sh './gradlew clean test jacocoTestReport'
                    // Für Maven könnte es folgendermaßen aussehen:
                    // sh 'mvn clean test jacoco:report'
                }
            }
        }
        stage('Publish Jacoco Report') {
            steps {
                // Achte auf die korrekte Angabe der Pfadangaben je nach Build-Tool
                jacoco(
                    execPattern: '**/build/jacoco/test.exec', // Für Gradle
                    classPattern: '**/build/classes/java/main', // Für Gradle
                    sourcePattern: '**/src/main/java',
                    changeBuildStatus: false
                )
                // Für Maven könnte es folgendermaßen aussehen:
                // jacoco(
                //     execPattern: '**/target/jacoco.exec', // Für Maven
                //     classPattern: '**/target/classes', // Für Maven
                //     sourcePattern: '**/src/main/java',
                //     changeBuildStatus: false
                // )
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
