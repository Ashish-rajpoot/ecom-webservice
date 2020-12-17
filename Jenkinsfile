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
    }      
    
}