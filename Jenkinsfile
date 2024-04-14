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
                dir('/home/yaw/devops/ci-cd/repo/Java-Ecommerce-Webapp-Kessie/project') {
                    sh 'mvn clean test package'
                }
            }
        }
    }
}
