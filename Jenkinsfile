pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                sh 'echo checkout'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/umipzhaw/DevOpsDemo']])
            }
        }
        
        stage('Compile') {
            steps {
                sh 'echo compile'
                // Hier ein Beispiel für ein Java-Projekt mit Maven
                sh 'mvn clean compile'
            }
        }
        
        stage('Test') {
            steps {
                sh 'echo test'
                // Führe Tests aus, auch hier ein Beispiel mit Maven
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                sh 'echo deploy'
            }
        }
        
        stage('Archive Artifacts') {
            steps {
                sh 'echo archive artifacts'
                // Archiviere bestimmte Dateien, hier beispielhaft für JAR-Dateien
                archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
            }
        }
    }
}
