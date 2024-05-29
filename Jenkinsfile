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
stage('SonarQube analysis') {
    steps {
        script {
            def scannerHome = tool 'sonar-scanner' // Assuming SonarQube Scanner is installed as a Jenkins tool
            // Adjust project directory path if needed
            def projectDir = 'hello-world'
            
            withSonarQubeEnv('sq1') {
                // Use sh for broader OS compatibility
                bat "${scannerHome}/bin/sonar-scanner \
                    -Dsonar.projectKey=squ_90d802fe8575b2d39603660d7d05d9c483009609 \
                    -Dsonar.sources=${projectDir}"
            }
        }
    }
}


 stage("Quality Gate") {
      steps {
        timeout(time: 5, unit: 'MINUTES') {
          waitForQualityGate abortPipeline: true
        }
      }
 }

  }
}