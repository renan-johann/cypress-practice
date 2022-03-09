import groovy.json.JsonOutput

pipeline {
    agent {
        dockerfile true
    }
    
    environment {
        BUILD_USER = ''
    }
    
    parameters {
        string(name: 'SPEC', defaultValue: 'cypress/integration/UI-Automation/specs/*.ts', description: 'Ej: cypress/integration/pom/*.spec.js')
        choice(name: 'BROWSER', choices: ['chrome', 'edge', 'firefox'], description: 'Pick the web browser you want to use to run your scripts')
    }
    
    options {
        ansiColor('xterm')
    }

    stages {
        
        stage('Build') {
            steps {
                echo "Building the application"
                sh 'npm config ls'
            }
        }
        
        stage('Testing') {
            steps {
                sh "npm i -g typescript"
                sh "npx cypress run --headless --browser ${BROWSER} --spec ${SPEC}"
            }
        }
        
        stage('Deploy') {
            steps {
                echo "Deploying"
            }
        }
    }
}