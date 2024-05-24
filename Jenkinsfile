pipeline {
  agent any
  options {//storage cleaner
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
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
    stage('Scan') {
      steps {
        withSonarQubeEnv(installationName: 'sq1') { 
          bat './mvnw clean org.sonarsource.scanner.maven:sonar-maven-plugin:3.9.0.2155:sonar'
        }
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