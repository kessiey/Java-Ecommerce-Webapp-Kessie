pipeline {
    agent any

    tools {
        maven "maven 3.9.6"
    }

    stages {
        stage("Git Clone") {
            steps {
                git branch: 'main', url: 'https://github.com/kessiey/Java-Ecommerce-Webapp-Kessie.git'
            }
        }
        
        stage("Build, Test and Package") {
            steps {
                sh 'mvn clean test package'
            }
        }

        stage('SonarQube Analysis') {
            environment {
                ScannerHome = tool 'sonar5.0'
            }
            steps {
                script {
                    withSonarQubeEnv(credentialsId: 'onartoken') {
                        sh "${ScannerHome}/bin/sonar-scanner -Dsonar.projectKey=ecommerce-webapp"
                    }
                }
            }
        }
    }
}
