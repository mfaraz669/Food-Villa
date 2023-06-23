pipeline {
  agent any
  
  stages {
    stage('Checkout') {
      steps {
        // Checkout the source code from your Git repository
        git 'https://github.com/your-repo/react-app.git'
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

