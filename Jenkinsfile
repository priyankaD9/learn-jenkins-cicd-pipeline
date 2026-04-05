stage('Build') {
    agent {
        docker {
            image 'node:18-alpine'
            args '-u 110:111'
            reuseNode true
        }
    }

    steps {
        sh '''
            echo "Node & NPM version"
            node -v
            npm -v

            echo "Clean old files"
            rm -rf node_modules package-lock.json

            echo "Create safe npm cache"
            mkdir -p /tmp/.npm

            echo "Install dependencies"
            npm ci --cache /tmp/.npm

            echo "Build project"
            npm run build
        '''
    }
}