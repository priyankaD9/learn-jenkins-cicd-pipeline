stage('Build') {
    agent {
        docker {
            image 'node:18-alpine'
            args '-u 1000:1000'
            reuseNode true
        }
    }

    environment {
        NPM_CONFIG_CACHE = '.npm'
    }

    steps {
        sh '''
            echo "Node & NPM version"
            node -v
            npm -v

            echo "Create local npm cache"
            mkdir -p .npm

            echo "Fix permissions"
            chmod -R 777 .npm

            echo "Install dependencies"
            npm ci

            echo "Build project"
            npm run build
        '''
    }
}