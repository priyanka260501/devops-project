pipeline {
    agent any

    environment {
        ENV = 'dev'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code for environment: ${ENV}"
                checkout scm
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

        stage('Deploy to Kubernetes') {
            steps {
                echo "Deploying to ${ENV} namespace in Kubernetes..."
                sh 'kubectl apply -f kubernetes/${ENV}/'
                sh 'kubectl get pods -n ${ENV}'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline succeeded for ${ENV}!"
            sh 'kubectl get services -n ${ENV}'
        }
        failure {
            echo "❌ Pipeline failed for ${ENV}!"
        }
    }
}
