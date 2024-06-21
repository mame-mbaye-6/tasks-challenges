pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mame650/challenge:latest'
        DOCKER_CREDENTIALS_ID = 'Dockerhub-credentials-id'
        KUBECONFIG_CREDENTIALS_ID = 'kubeconfig'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git 'https://github.com/mame-mbaye-6/ctf-challenges'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("${DOCKER_IMAGE}:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', DOCKER_CREDENTIALS_ID) {
                        dockerImage.push()
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withCredentials([file(credentialsId: KUBECONFIG_CREDENTIALS_ID, variable: 'KUBECONFIG')]) {
                        sh '''
                            chmod +x deploy.sh
                            ./deploy.sh
                        '''
                    }
                }
            }
        }
    }
}

