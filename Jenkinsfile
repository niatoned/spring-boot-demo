pipeline {
   agent none
   stages {
      stage('Maven Install') {
         agent {
              docker {
                  image 'maven:3.8.1-adoptopenjdk-11'
                  args '-v /root/.m2:/root/.m2'
              }
          }
    
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
   
      }
        
        stage('Docker Build') {
          agent any
          steps {
             script {
               docker.build("niatoned/spring-boot-demo:latest")
             }
          }
        }
    }
}

