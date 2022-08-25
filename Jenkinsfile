pipeline {
  agent any
  stages {
    stage ('verify tooling') {
      steps {
        sh '''
          docker version
          docker info
          docker compose version
          curl --version
          jq --version
        '''
      }
    }
    stage ('cleanup') {
      steps {
        sh 'pwd && ls -lh'
        sh './mongo-stop.sh' 
      }
    }
    stage('build') {
       steps {
        echo 'building the app...'
        sh 'docker compose up -d --no-color --wait'
        sh 'docker compose ps'       
      }
    }
    stage('test') {
       steps {
        echo 'testing the app...'
        sh 'curl http://mongo-app:3000/'
      }
    }
    stage('deploy') {
    
      steps {
        echo 'deploying the app...'
      }
    }
  }
}
