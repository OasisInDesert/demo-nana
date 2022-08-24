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
    stage("build") {
    
      steps {
        echo 'building the app...'
      }
    }
    stage("test") {
    
      steps {
        echo 'testing the app...'
      }
    }
    stage("deploy") {
    
      steps {
        echo 'deploying the app...'
      }
    }
  }
}