pipeline {
    agent any

    options {
        skipDefaultCheckout(true)
    }

    stages {

        stage('Clean Workspace') {
            steps {
                deleteDir()
            }
        }

        stage('Checkout') {
            steps {
                git 'https://github.com/priyankaD9/learn-jenkins-app.git'
            }
        }

        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                    args '--user 110:111'
                    reuseNode true
                }
            }

            steps {
                sh '''
                    echo "Node & NPM version"
                    node -v
                    npm -v

                    echo "Create local npm cache"
                    mkdir -p .npm

                    echo "Install dependencies"
                    npm ci --cache .npm

                    echo "Build project"
                    npm run build
                '''
            }
        }
    }
}