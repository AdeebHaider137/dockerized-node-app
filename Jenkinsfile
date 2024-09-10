pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/AdeebHaider137/dockerized-node-app.git'
            }
        }
    stage('Run Tests') {
        steps {
            script {
                  sh 'npm test'
            }
        }
    }
        
        stage('Build Docker Image') {
            steps {
                script {
                    def appImage = docker.build("mydna:${env.BUILD_ID}")
                }
            }
        }
        
        stage('Deploy Docker Container') {
            steps {
                script {
                    
                    sh 'docker stop my-app-container || true'
                    sh 'docker rm my-app-container || true'
                    
                    
                    sh 'docker run -d --name my-app-container -p 5000:5000 mydna:${env.BUILD_ID}'
                }
            }
        }
        stage('Cleanup') {
            steps {
                 script {
                    sh 'docker system prune -f'
                 }
            }
        }
    }
}
