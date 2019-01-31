def imageTag = 'dummy'

pipeline {
    agent { label 'docker' }
    parameters {
        booleanParam defaultValue: false, description: 'Tag production', name: 'PRODUCTION'
    }
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
                    docker.withRegistry("", "docker-creds") {
                        app.push("$imageTag")
                    }
                }
            }
        }
    }
}

def imageTagMap(String branchName) {
    if (branchName == "master") {
        if (env.PRODUCTION.toBoolean()) {
            return "prod"
        }
        return "stage"
    }
    if (branchName == "develop") {
        return "dev"
    }
    return branchName
}
