pipeline {
  agent any
  stages {
    stage ('checkup') {
      steps {
        echo 'Checking up the environment...'
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
        sh './mongo-stop.sh' 
      }
    }
    stage('build') {
       steps {
        echo 'Building the app...'
        sh 'docker compose up -d --no-color --wait'
        sh 'docker compose ps'
        echo 'waiting for mongo-app..'
        sh 'sleep 2s'
      }
    }
    stage('test') {
       steps {
        echo 'Testing the app...'
        sh 'curl -m 6 http://mongo-app:3000/'
      }
    }
    stage('deploy') {
      steps {
        echo 'Deploying the app...'
      }
    }
  }
  post {
    cleanup {
      echo 'Cleaning up ...'
      // sh 'docker compose down'
    }
  }
  
}
