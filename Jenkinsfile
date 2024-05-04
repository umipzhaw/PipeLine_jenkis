pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                sh 'echo checkout'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/umipzhaw/DevOpsDemo']])
            }
        }
        
        stage('Print Environment Info') {
            steps {
                script {
                    // Drucke Umgebungsvariablen
                    sh 'printenv'
                    
                    // Drucke den Arbeitsverzeichnispfad
                    sh 'pwd'
                    
                    // Liste die Dateien im aktuellen Verzeichnis auf
                    sh 'ls -al'
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
