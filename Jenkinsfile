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
        stage('Tag docker image'){
            steps {
                sh 'docker tag ecom-webservice ashish142/ecom-webservice:1.0.0'
            }          
        }
        stage('Push docker image'){
            steps {
                sh 'sudo docker push ashish142/ecom-webservice:1.0.0'
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
            docker container run --restart always --name ecom-webservice -p 8082:8081 -d ecom-webservice
            '''
            }
        }    
    }      
    
}