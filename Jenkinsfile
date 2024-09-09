pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('dockerhub')
        DOCKER_IMAGE_NAME = "stefanalexh99/hello-world-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/yourrepo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${DOCKER_IMAGE_NAME}:latest ."
                }
            }
        }

        stage('Docker Login') {
            steps {
                script {
                    sh "echo ${DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }

        stage('Push Docker Image to DockerHub') {
            steps {
                script {
                    sh "docker push ${DOCKER_IMAGE_NAME}:latest"
                }
            }
        }
    }

    post {
        always {
            script {
                sh "docker logout"
                sh "docker rmi ${DOCKER_IMAGE_NAME}:latest"
            }
        }
    }
}
