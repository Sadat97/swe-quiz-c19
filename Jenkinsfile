pipeline {
  agent {
    docker {
      image 'ruby:2.7.0'
    }

  }
  stages {
    stage('setup') {
      steps {
        sh '''gem install bundler -v 2.0.1
bundle install
rails db:migrate'''
      }
    }
  }
}