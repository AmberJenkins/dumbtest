def imageTag = 'dummy'

pipeline {
    agent { label 'docker' }
    stages {
        stage("Update the tag") {
            steps {
                script {
                    imageTag = imageTagMap("$BRANCH_NAME")
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

def imageTagMap(String branchName) {
    if (branchName == "master") {
        return "stage"
    }
    if (branchName == "develop") {
        return "dev"
    }
    return branchName
}
