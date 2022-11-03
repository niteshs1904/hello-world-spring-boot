pipeline {
   tools {
       maven 'M3'
   } 
agent any /* Using master itself so not using labels here*/ 
stages {
    stage('SCM Checkout'){
      steps{
        script {
           git 'https://github.com/niteshs1904/hello-world-spring-boot.git'
          }
      }
    }
    stage("BuildApp"){
        steps {
           sh "mvn clean install"
           sh "ls -al target/"
        }
    }
    stage("BuildDocker"){
        steps{
            sh """
            docker container ls 
            docker build . -f Dockerfile -t spring-boot:v1
            docker container run -itd --name springboot -p 8080:8080 spring-boot:v1
            curl -v http://localhost:8080
            docker container rm springboot
            """
            
        }
    }
  }
  post {
      always {
          cleanWs()
      }
  }
  
}

