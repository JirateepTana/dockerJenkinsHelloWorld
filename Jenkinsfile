pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        echo 'Checkout Method.....'
        // Checkout your GitHub repository
       git url: 'https://github.com/JirateepTana/dockerJenkinsHelloWorld.git' , branch: 'main'
      }
    }

    stage('Install dependencies') {
      steps {
        // Install Node.js dependencies (sh for linux, bat for windows)
        echo 'Start Install dependencies'
        bat 'cd hello-world && npm install'
      }
    }

    stage('Build') {
      steps {
        // Build the Next.js application
        echo 'Start build project'
        bat 'cd hello-world && npm run build'
      }
    }

    stage('Test') {
      steps {
        // Run tests for the Next.js application
        echo 'Start Test project before deploy'
        bat 'cd hello-world && npm run test'
      }
    }

    stage('Deploy') {
      steps {
        // Perform deployment steps here, e.g., deploying to a hosting environment
        // You can use a plugin or custom scripts for deployment
        // Example: sh 'npm run deploy'
        echo 'Start Deploy Application!!!'
      }
    }
  }
}