pipeline {
    agent any

    stages {

        stage('Build') {
            agent {
                docker {
                    image 'clean-node-app'
                    reuseNode true
                }
            }

            steps {
                sh '''
                    npm install
                    npm run build
                '''
            }
        }

    }
}