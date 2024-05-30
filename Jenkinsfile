pipeline {


    // parameters {
    //     booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    // } 
    // environment {
    //     AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
    //     AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    // }





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
        sh 'cd hello-world && npm install'
        
      }
    }

    stage('Build') {
      steps {
        // Build the Next.js application
        echo 'Start build project'
        sh 'cd hello-world && npm run build'
        
      }
    }
stage('SonarQube analysis') {
  steps {
    script {
      withSonarQubeEnv('sq1') {
        sh 'cd hello-world && C:\\tools\\sonar-scanner-5.0.1.3006-windows\\bin\\sonar-scanner.bat -Dsonar.projectKey=squ_ccc0d798e8aec1730c5ab046d6edad7751be72e6'
      }
    }
  }
}

stage('Quality Gate') {
  steps {
    waitForQualityGate abortPipeline: true
  }
}




  }
}