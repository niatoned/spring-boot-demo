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
      
      stage('Docker Push') {
         agent any
         steps {
            withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
            sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
             sh 'docker push niatoned/spring-boot-demo:latest'
           }
         }
       }
      stage('Deploy'){
         agent any
            steps {
                sh "docker stop niatoned/spring-boot-demo | true"
                sh "docker rm niatoned/spring-boot-demo | true"
                sh "docker run --name spring-boot-demo -d -p 8080:8080 niatoned/spring-boot-demo:latest"
            }
        }
    }
}

