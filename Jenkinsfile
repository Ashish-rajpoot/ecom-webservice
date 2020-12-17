pipeline {
    agent any 

    triggers {
        pollSCM('* * * * *')
    }

    

    stages {

        stage('Compile Stage') {
            steps {
                echo '::::: Hello, Compile  :::::'
                   sh 'mvn clean compile'      
                     sh 'mvn --version'            
            }
        }  

        stage('mvn Build Stage') {
            steps {
                  echo '::::: Hello, mvn Build stage  :::::'
                sh 'mvn clean package -DskipTests'                              
            }
        }  
         stage('Docker Build Stage') {
            steps {
                  echo '::::: Hello, Docker Build stage  :::::'
                sh 'docker image build -t ecom-webservice .'                              
            }
        } 
        stage('Deploy Stage') {
            steps {
                echo 'Hello, Docker Deployment.'
                sh '''
                 (if  [ $(docker ps -a | grep ecom-webservice | cut -d " " -f1) ]; then \
                        echo $(docker rm -f ecom-webservice); \
                        echo "---------------- successfully removed ecom-webservice ----------------"
                     else \
                    echo OK; \
                 fi;);
            docker container run --restart always --name ecom-webservice -port 8082:8081 -d ecom-webservice
            '''
            }
        }    
    }      
    
}