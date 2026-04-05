stage('Build') {
    agent {
        docker {
            image 'node:18-alpine'
            reuseNode true
        }
    }

    steps {
        sh '''
            echo "Node & NPM version"
            node -v
            npm -v

            echo "Install dependencies"
            npm ci

            echo "Build project"
            npm run build
        '''
    }
}