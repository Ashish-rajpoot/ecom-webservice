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

        stage('Deploy Stage') {
            steps {
                echo '::::: Deploy, jdk  :::::'   
                             
            }
        }        
    }      
    
}