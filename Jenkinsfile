import groovy.json.JsonOutput

pipeline {
    agent {
        dockerfile true
    }
    
    environment {
        BUILD_USER = ''
    }
    
    parameters {
        string(name: 'SPEC', defaultValue: 'cypress/e2e/UI-Automation/specs/*.js', description: 'Ej: cypress/e2e/pom/*.spec.js')
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