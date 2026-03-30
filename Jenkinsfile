pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                    reuseNode true
                }
            }

            steps {
                sh '''
                    node -v
                    npm -v

                    npm config set cache /tmp/.npm --global

                    rm -rf node_modules package-lock.json || true

                    npm install
                    npm run build
                '''
            }
        }
    }
}