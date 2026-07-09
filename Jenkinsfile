pipeline {

    agent any

    environment {

        PROJECT_ID = "gcp-devops-project-501115"
        REGION = "asia-south1"
        REPOSITORY = "employee-app-repo"

        BACKEND_IMAGE = "${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}/employee-backend:latest"
        FRONTEND_IMAGE = "${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPOSITORY}/employee-frontend:latest"
    }

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Configure Docker') {
            steps {
                sh '''
                gcloud auth configure-docker asia-south1-docker.pkg.dev --quiet
                '''
            }
        }

        stage('Build Backend') {
            steps {
                sh '''
                docker build -t $BACKEND_IMAGE ./backend
                '''
            }
        }

        stage('Build Frontend') {
            steps {
                sh '''
                docker build -t $FRONTEND_IMAGE ./frontend
                '''
            }
        }

        stage('Push Images') {
            steps {
                sh '''
                docker push $BACKEND_IMAGE
                docker push $FRONTEND_IMAGE
                '''
            }
        }

        stage('Deploy Backend') {
            steps {
                sh '''
                kubectl set image deployment/backend backend=$BACKEND_IMAGE -n employee-app
                '''
            }
        }

        stage('Deploy Frontend') {
            steps {
                sh '''
                kubectl set image deployment/frontend frontend=$FRONTEND_IMAGE -n employee-app
                '''
            }
        }

        stage('Wait for Rollout') {
            steps {
                sh '''
                kubectl rollout status deployment/backend -n employee-app
                kubectl rollout status deployment/frontend -n employee-app
                '''
            }
        }

    }

}