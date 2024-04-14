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
                dir('EcommerceApp') {
                    sh 'mvn clean test package'
                }
            }
        }

        stage('SonarQube Analysis') {
            steps {
                echo "SonarQube Scanning and Analysis..."
                script {
                    dir('EcommerceApp') {
                        def compiledClassesDir = sh(script: 'mvn help:evaluate -Dexpression=project.build.outputDirectory -q -DforceStdout', returnStdout: true).trim()

                        withSonarQubeEnv('sonarqube') {
                            sh "${ScannerHome}/bin/sonar-scanner -Dsonar.projectKey=ecommerceapp -Dsonar.java.binaries=${compiledClassesDir}"
                        }
                    }
                }  
            }
        }
    }
}
