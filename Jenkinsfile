pipeline {
    agent any

    environment {
        REGISTRY = 'seed.int.repositories.cloud.sap'
        REPO = 'seed'
        IMAGE_NAME = 'challenge1image'
        KUBE_CONFIG = credentials('kubeconfig')  // Assuming you have a Jenkins credential with ID 'kubeconfig'
        DOCKER_CREDENTIALS = credentials('docker-credentials') // Assuming you have a Jenkins credential with ID 'docker-credentials'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${REGISTRY}/${REPO}/${IMAGE_NAME}:${env.BUILD_NUMBER}")
                }
            }
        }
        
        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry("https://${REGISTRY}", 'docker-credentials') {
                        docker.image("${REGISTRY}/${REPO}/${IMAGE_NAME}:${env.BUILD_NUMBER}").push()
                    }
                }
            }
        }
        
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    withKubeConfig([credentialsId: 'kubeconfig']) {
                        sh """
                        kubectl set image deployment/your-deployment your-container=${REGISTRY}/${REPO}/${IMAGE_NAME}:${env.BUILD_NUMBER}
                        kubectl rollout status deployment/your-deployment
                        """
                    }
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}

