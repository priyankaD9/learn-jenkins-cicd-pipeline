pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                    args '--user 110:111'   // match Jenkins user
                    reuseNode true
                }
            }

            steps {
                sh '''
                    echo "Node & NPM version"
                    node -v
                    npm -v

                    echo "Clean workspace"
                    rm -rf node_modules

                    echo "Install dependencies"
                    npm ci --cache /tmp/.npm

                    echo "Build project"
                    npm run build
                '''
            }
        }
    }
}