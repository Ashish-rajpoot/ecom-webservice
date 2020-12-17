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
                sh 'mvn clean package -DskipTests'  
                             
            }
        }        
    }      
    
}