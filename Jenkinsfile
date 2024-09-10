pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/AdeebHaider137/dockerized-node-app.git'
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def appImage = docker.build('mydna')
                }
            }
        }
        
        stage('Deploy Docker Container') {
            steps {
                script {
                    // Stop and remove the existing container
                    sh 'docker stop my-app-container || true'
                    sh 'docker rm my-app-container || true'
                    
                    // Run the new container
                    sh 'docker run -d --name my-app-container -p 5000:5000 mydna'
                }
            }
        }
    }
}
