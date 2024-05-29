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
            
             // Assuming credential ID is 'sonarcube_token'
            withCredentials([username: '$class', password: '$class', file: 'squ_bd90399c7c384fe55953f186872af8285fdd776e']) {
            withSonarQubeEnv('sq1') { // Assuming sq1 is your configuration name
                    bat """
                        ${scannerHome}/bin/sonar-scanner -X \
                        -Dsonar.token=\$file \
                        -Dsonar.sources=${projectDir}
                    """
                }
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