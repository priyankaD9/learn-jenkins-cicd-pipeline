pipeline {
    agent any

    stages {

        stage('Build') {
            agent {
                docker {
                    image 'node:18'
                    args '-u 1000:1000'
                    reuseNode true
                }
            }

            steps {
                sh '''
                    rm -rf node_modules
                    npm ci
                    npm run build
                '''
            }
        }
    }
}