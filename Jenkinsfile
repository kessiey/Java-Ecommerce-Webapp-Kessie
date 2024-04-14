pipeline {
    agent any

    tools {
        maven "maven 3.9.6"
    }

    stages {
        stage("Git Clone") {
            steps {
                https://github.com/kessiey/Java-Ecommerce-Webapp-Kessie.git
            }
        }
        
        stage("Build, Test and Package") {
            steps {
                sh mvn clean test package
            }
        }
    }
}
