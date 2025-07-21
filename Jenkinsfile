pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        sh 'mvn clean package'
      }
    }
    stage('Docker Build') {
      steps {
        sh 'docker build -t dakch/moocozin .'
      }
    }
    stage('Push Image') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'USER', passwordVariable: 'PASS')]) {
          sh 'echo $PASS | docker login -u $USER --password-stdin'
          sh 'docker push dakch/moocozin'
        }
      }
    }
    stage('Deploy') {
      steps {
        sh 'helm upgrade --install moocozin helm/moocozin'
      }
    }
  }
}