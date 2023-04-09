pipeline {
   agent {
        docker {
            image 'maven:3.8.1-adoptopenjdk-11'
            args '-v /root/.m2:/root/.m2'
        }
    }
    stages {
        stage('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        
        stage('Docker Build') {
            agent any
          steps {
            sh 'docker build -t niatoned/spring-boot-demo:latest .'
          }
        }
    }
}
