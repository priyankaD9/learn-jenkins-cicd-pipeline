pipeline {
    agent any

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:18-alpine'
                    args '-u root:root'
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

                    echo "Fix npm cache"
                    export npm_config_cache=/tmp/.npm
                    mkdir -p /tmp/.npm
                    chmod -R 777 /tmp/.npm

                    echo "Clean old files"
                    rm -rf node_modules

                    echo "Install dependencies (CI mode)"
                    npm ci

                    echo "Build project"
                    npm run build
                '''
            }
        }
    }
}