pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                echo 'Cloning Repository...'
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                sh 'docker build -t simple-webapp:latest .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh '''
                docker stop simple-webapp || true
                docker rm simple-webapp || true
                '''
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                docker run -d \
                --name simple-webapp \
                -p 80:80 \
                simple-webapp:latest
                '''
            }
        }

        stage('Health Check') {
            steps {
                sh 'sleep 10'
                sh 'curl http://localhost'
            }
        }

    }

    post {

        success {
            echo 'Deployment Successful'
        }

        failure {
            echo 'Deployment Failed'
        }

    }

}