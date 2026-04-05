stage('Build') {
    agent {
        docker {
            image 'node:18-alpine'
            args '-u 110:111'
            reuseNode true
        }
    }

    environment {
        NPM_CONFIG_CACHE = '/tmp/.npm'
    }

    steps {
        sh '''
            echo "Node & NPM version"
            node -v
            npm -v

            echo "Create npm cache inside container"
            mkdir -p /tmp/.npm

            echo "Install dependencies"
            npm ci

            echo "Build project"
            npm run build
        '''
    }
}