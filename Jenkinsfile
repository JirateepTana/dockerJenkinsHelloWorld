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
      def scannerHome = tool 'sonar-scanner'
      def projectDir = 'hello-world'
      
      withSonarQubeEnv('sq1') {
    bat "${scannerHome}\\bin\\sonar-scanner.bat -Dsonar.tests=${projectDir}/__tests__ -Dsonar.lang.patterns.js=**/*.js,**/*.jsx -Dsonar.lang.patterns.ts=**/*.ts,**/*.tsx,**/*.cts,**/*.mts -Dsonar.token=squ_aa4186b4b21f2fb546120516f69341b7d5c3996d"
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