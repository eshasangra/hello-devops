pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh '''
                echo "[1] Building Docker image from Dockerfile"
                docker build -t hello-devops:latest .
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                echo "[2] Stop+remove old container if it exists"
                docker rm -f hello-container || true

                echo "[3] Run new container"
                # Map container port 5000 -> host port 5001
                docker run -d -p 5001:5000 --name hello-container hello-devops:latest
                '''
            }
        }

        stage('Smoke Test') {
            steps {
                sh '''
                echo "[4] Testing that the container is actually serving"
                echo "curl output below:"
                curl -s http://localhost:5001
                '''
            }
        }
    }
}

