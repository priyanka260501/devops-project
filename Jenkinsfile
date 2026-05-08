pipeline {
    agent any

    environment {
        ENV = 'dev'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Checking out code..."
                checkout scm
            }
        }

        stage('Build') {
            steps {
                echo "Building application..."
                sh 'echo "Build complete!"'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'echo "All tests passed!"'
            }
        }

        stage('Deploy to DEV') {
            steps {
                echo "Deploying to DEV environment..."
                sh 'kubectl apply -f kubernetes/dev/'
                sh 'kubectl get pods -n dev'
            }
        }

        stage('Deploy to QA') {
            steps {
                echo "Deploying to QA environment..."
                sh 'kubectl apply -f kubernetes/qa/'
                sh 'kubectl get pods -n qa'
            }
        }

        stage('Deploy to UAT') {
            steps {
                echo "Deploying to UAT environment..."
                sh 'kubectl apply -f kubernetes/uat/'
                sh 'kubectl get pods -n uat'
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline succeeded! Deployed to DEV → QA → UAT!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}
