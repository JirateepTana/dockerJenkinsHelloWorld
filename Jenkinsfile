pipeline {
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 


  agent any
  options {//storage cleaner
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }

  
  stages {
    stage('Checkout') {
      steps {

                         script{
                        dir("terraform")
                        {
                          echo 'Checkout Method.....'
                            git url: 'https://github.com/JirateepTana/dockerJenkinsHelloWorld.git' , branch: 'main'
                        }
                    }
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
      withEnv(['SONAR_SCANNER_HOME=/opt/sonar-scanner-5.0.1.3006-linux']) {
        withSonarQubeEnv('sq1') {
          sh 'cd hello-world && $SONAR_SCANNER_HOME/bin/sonar-scanner -Dsonar.projectKey=squ_3dd24cdb24a9c28f3089a10f954d94d6426089fe'
        }
      }
    }
  }
}




    


}

}