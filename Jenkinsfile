pipeline {

    agent any

    environment {
        GITHUB_CREDENTIALS = credentials('github')
        DOCKER_SERVER = 'ghcr.io'
        IMAGE_NAME = 'ghcr.io/tolisapostolidis/myelga-database'
    }

    stages {

        stage('Prepare Image Tag') {
            steps {
                sh '''
                    HEAD_COMMIT=$(git rev-parse --short HEAD)
                    echo "${HEAD_COMMIT}-${BUILD_NUMBER}" > image_tag.txt
                '''

                script {
                    env.IMAGE_TAG = readFile('image_tag.txt').trim()
                }

                echo "Image tag: ${env.IMAGE_TAG}"
            }
        }

        stage('Build Docker image') {
            steps {
                sh '''
                    echo "Building image ${IMAGE_NAME}:${IMAGE_TAG}"

                    docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -t ${IMAGE_NAME}:latest .
                '''
            }
        }

        stage('Login to GHCR') {
            steps {
                sh '''
                    echo "${GITHUB_CREDENTIALS_PSW}" | docker login ${DOCKER_SERVER} -u ${GITHUB_CREDENTIALS_USR} --password-stdin
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                sh '''
                    docker push ${IMAGE_NAME}:${IMAGE_TAG}
                    docker push ${IMAGE_NAME}:latest
                '''
            }
        }
    }

    post {

        success {
            echo 'Database image was built and pushed successfully.'
        }

        failure {
            echo 'Database pipeline failed.'
        }

        always {
            sh '''
                docker logout "${DOCKER_SERVER}" || true
            '''
        }
    }
}