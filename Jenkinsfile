pipeline {
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        // Checkout the source code from your Git repository
        git 'https://github.com/mfaraz669/Food-Villa.git'
      }
    }
    
    stage('Install Dependencies') {
      steps {
        // Use the NodeJS plugin to install Node.js and npm
        nodejs('node-version') {
          sh 'npm install'
        }
      }
    }
    
    stage('Build') {
      steps {
        // Build the React.js application
        nodejs('node-version') {
          sh 'npm run build'
        }
      }
    }
   
    stage('Static Code Analysis') {
      environment {
        SONAR_URL = "http://3.108.227.52:9000"
      }
      steps {
        withCredentials([string(credentialsId: 'sonarqube', variable: 'SONAR_AUTH_TOKEN')]) {
          // Run SonarQube Scanner to analyze the code
        withSonarQubeEnv('SonarQube-Server') {
          sh 'sonar-scanner' -Dsonar.login=$SONAR_AUTH_TOKEN -Dsonar.host.url=${SONAR_URL}'
        }
      }
    }
    
    stage('Deploy') {
      steps {
        // Deploy the built artifacts to the deployment environment
        // Replace the placeholders with your actual deployment commands
        sh 'your-deployment-command'
      }
    }
  }
  
  post {
    always {
      // Clean up temporary files or perform any necessary post-build actions
    }
  }
}

