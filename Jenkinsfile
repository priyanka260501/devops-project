pipeline {
    agent any

    environment {
        ENV = 'dev'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code for environment: ${ENV}"
            }
        }

        stage('Build') {
            steps {
                echo "Building application for ${ENV}..."
                sh 'echo "Build step running on Jenkins!"'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests for ${ENV}..."
                sh 'echo "All tests passed!"'
            }
        }

        stage('Deploy') {
            steps {
                echo "Deploying to ${ENV} environment..."
                sh 'echo "Deployment complete!"'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline succeeded for ${ENV}!"
        }
        failure {
            echo "❌ Pipeline failed for ${ENV}!"
        }
    }
}
