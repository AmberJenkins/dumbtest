pipeline {
    agent { label 'docker' }
    stages {
        stage("Build and push docker") {
            steps {
                docker.build('swails/clock:first-pass', '-f Dockerfile .')
            }
        }
    }
}
