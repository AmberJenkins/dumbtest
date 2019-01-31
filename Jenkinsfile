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
                    def app = docker.build("swails/clock:${imageTag}", "-f Dockerfile .")
                    docker.withRegistry("https://hub.docker.com", "docker-creds") {
                        app.push("$imageTag")
                    }
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
