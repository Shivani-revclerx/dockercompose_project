pipeline {
    agent any

    environment {
        DOCKER_COMPOSE = '/usr/local/bin/docker-compose' // Path to docker-compose binary
        IMAGE_NAME = 'my-node-app'
        COMPOSE_FILE = 'docker-compose.yml'
    }

    stages {
        stage('Checkout Code') {
            steps {
                // Checkout code from the repository
                git 'https://github.com/Shivani-revclerx/dockercompose_project.git' // Replace with your GitHub repo URL
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image using Dockerfile
                    docker.build("${IMAGE_NAME}:builder", "-f Dockerfile .")
                }
            }
        }

        stage('Start Docker Compose') {
            steps {
                script {
                    // Run docker-compose up in detached mode
                    sh """
                    ${DOCKER_COMPOSE} -f ${COMPOSE_FILE} up -d
                    """
                }
            }
        }

        stage('Run Tests') {
            steps {
                script {
                    // Assuming you have tests set up, e.g., using Jest
                    sh """
                    docker exec my-node-app-container npm test
                    """
                }
            }
        }

        stage('Tear Down Docker Compose') {
            steps {
                script {
                    // Tear down the environment after tests
                    sh """
                    ${DOCKER_COMPOSE} down
                    """
                }
            }
        }
    }

    post {
        always {
            // Clean the workspace after the build
            cleanWs()
        }

        success {
            echo 'Tests completed successfully!'
        }

        failure {
            echo 'There was a failure running the tests!'
        }
    }
}
