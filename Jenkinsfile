def imageTag = 'dummy'

pipeline {
    agent { label 'docker' }
    stages {
        stage("Update the tag") {
            steps {
                script {
                    imageTag = '${BRANCH_NAME}'
                }
            }
        }
        stage("Build and push docker") {
            steps {
                script {
                    docker.build('swails/clock:${imageTag}', '-f Dockerfile .')
                }
            }
        }
    }
}
