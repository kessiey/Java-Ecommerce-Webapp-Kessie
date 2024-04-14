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
                    withSonarQubeEnv(credentialsId: 'sonartoken') {
                        sh """
                        ${ScannerHome}/bin/sonar-scanner \
                        -Dsonar.projectKey=ecommerce-webapp \
                        -Dsonar.projectName=ecommerce-webapp \
                        -Dsonar.java.binaries=.
                        """
                    }
                }
            }
        }

        // stage('OWASP Dependency Check') {
        //     steps {
        //         script {
        //             dependencyCheck additionalArguments: '--scan ./', odcInstallation: 'owasp-dc'
        //             dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
        //         }
        //     }
        // }
        
        stage("Upload to Nexus") {
            steps {
                nexusArtifactUploader artifacts: [[artifactId: 'junit', classifier: '', file: '/var/lib/jenkins/workspace/ecommerce-webapp/target/project.war', type: 'war']], credentialsId: 'nexus-id', groupId: 'com.project', nexusUrl: 'localhost:8081', nexusVersion: 'nexus3', protocol: 'http', repository: 'ecommerce-webapp-snapshot', version: '0.0.1-SNAPSHOT'
            }
        }

        stage("Deploy to UAT") {
            steps {
                deploy adapters: [tomcat9(credentialsId: 'tomcat-credential', path: '', url: 'http://3.138.126.1:8080')], 
                contextPath: null, 
                war: 'target/*.war'
            }
        }
    }
}
