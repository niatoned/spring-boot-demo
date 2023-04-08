pipeline {
    agent any
    environment {
        DATE = new Date().format('yy.M')
        TAG = "${DATE}.${BUILD_NUMBER}"
    }
    stages {
        stage('Maven Install') {
    	  agent {
           docker {
        	image 'maven:3.8.1'
           }
         }
         steps {
        	sh 'mvn clean install'
         }
        }
        stage ('Build') {
            steps {
                sh 'mvn -B -DskipTests clean package'
            }
        }
        
    }
}
