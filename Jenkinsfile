pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                    args '-u root:root'   // run as root to avoid permission issues
                    reuseNode true
                }
            }

            environment {
                NPM_CONFIG_CACHE = '/tmp/.npm'
            }

            steps {
                sh '''
                    echo "Debugging workspace"
                    pwd
                    ls -la

                    echo "Node & NPM version"
                    node -v
                    npm -v

                    echo "Clean old files"
                    rm -rf node_modules package-lock.json || true

                    echo "Install dependencies"
                    npm install

                    echo "Build project"
                    npm run build
                '''
            }
        }
    }
}