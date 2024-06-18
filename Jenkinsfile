pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = credentials('Dockerhub-credentials-id')
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/mame-mbaye-6/ctf-challenges.git', branch: 'master', credentialsId: 'Github-token'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    dockerImage = docker.build("mame-mbaye/ctf-challenges:${env.BUILD_ID}")
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', 'Dockerhub-credentials-id') {
                        dockerImage.push("${env.BUILD_ID}")
                        dockerImage.push('latest')
                    }
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    kubernetesDeploy configs: 'deployment.yaml', kubeConfig: [path: env.KUBE_CONFIG]
                }
            }
        }
    }

//    post {
//        always {
//            cleanWs()
//        }
//    }
}

