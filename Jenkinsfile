pipeline {
  agent {
    docker {
      image 'ruby:2.5.1'
    }

  }
  stages {
    stage('setup') {
      steps {
        sh '''gem install bundler -v 2.0.1
bundle install'''
      }
    }
  }
}
