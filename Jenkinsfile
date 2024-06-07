pipeline {



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

stage('Pull Latest Changes') {
  steps {
    echo 'Pulling latest changes from the repository'
    sh 'git pull origin main'
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

    stage('Remove Old Docker Container') {
      steps {
        script {
          sh 'docker rm -f my-container || true'
        }
      }
    }

    stage('Build Docker Image') {
      steps {
        script {
          docker.build("jirateep/dockerjenkinshelloworld:1.0", "hello-world")
        }
      }
    }

    stage('Run Docker Container') {
      steps {
        script {
          docker.image("jirateep/dockerjenkinshelloworld:1.0").run("--name my-container -p 3000:3000")
        }
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