def doDeployment(def cluster, def dockerVersion, def namespace, def replica, def dkiServiceName, def dockerVersionRollback){
    try{
        sh """
        if [[ ${namespace} == "production" ]]; then
          ./deployment.sh ${dockerVersion} ${namespace} ${replica} ${limitCPURelease} ${limitMemoryRelease} ${reqCPURelease} ${reqMemoryRelease} ${dkiServiceName} ${dockerVersionRollback}
        else
          ./deployment.sh ${dockerVersion} ${namespace} ${replica} ${limitCPUAlpha} ${limitMemoryAlpha} ${reqCPUAlpha} ${reqMemoryAlpha} ${dkiServiceName}
        fi
        """

        withCredentials([kubeconfigFile(credentialsId: "${cluster}", variable: 'KUBECONFIG')]) {
            sh """
              kubectl apply -f kubernetes/${namespace}/ -n ${namespace}
            """
        }
        currentBuild.result == "SUCCESS"
    } catch(e){
        currentBuild.result == "FAILURE"
        throw e
    } finally {
        if (currentBuild.result == "FAILURE") {
            echo "Deployment Failure"
        }
    }
}

def pushToRegistry(def dockerVersion){
    try {
        docker.withRegistry("https://${crUri}", "${crCred}") {
            docker.image("${imageName}").push("${dockerVersion}")
        }
        currentBuild.result = 'SUCCESS'
    } catch(e) {
        currentBuild.result = 'FAILURE'
        throw e
    } finally {
        if (currentBuild.result == "FAILURE") {
            echo 'FAIL in Push to registry Stage'
        }
    }
}

pipeline {
    agent {
        node {
            label 'jenkins-slave'
        }
    }
    environment {
        serviceName = "${JOB_NAME}".split('/').first()
        crUri = "registry-intl-vpc.ap-southeast-5.aliyuncs.com/danakini/${serviceName}"
        crCred = "cr-auth"
        imageName = "${crUri}"
        gitRepository = "github.com/danakini-dev/${serviceName}.git"
        gitCommitHash = sh(returnStdout: true, script: 'git rev-parse HEAD').trim()
        shortCommitHash = gitCommitHash.take(7)
        // limit Memory and CPU development & staging
        limitMemoryAlpha = "4Gi"
        limitCPUAlpha = "2"
        reqMemoryAlpha = "2Gi"
        reqCPUAlpha = "1"
        // limit Memory and CPU Production
        limitMemoryRelease = "8Gi"
        limitCPURelease = "2"
        reqMemoryRelease = "4Gi"
        reqCPURelease = "2"
    }
    stages {
        stage ('Build & Preparations') {
            steps {
                script {
                    if (env.GIT_BRANCH.contains("feature") || env.GIT_BRANCH.contains("hotfix") || env.GIT_BRANCH.contains("bugfix") || env.GIT_BRANCH.contains("root")) {
                        env.versioningCode = "sn" // sn = snapshot -> for service_name k8s and versioning
                        env.alphaNS = "development"
                    } else if (env.GIT_BRANCH.contains("main")){
                        env.versioningCode = "rc" // rc = release candidate -> for service_name k8s and versioning
                        env.alphaNS = "staging"
                    } else {
                        echo "environment server not match"
                        currentBuild.result == 'FAILURE'
                    }

                    env.alphaTag = "${versioningCode}-${shortCommitHash}"
                    sh "/usr/bin/wrapdocker"

                    env.tagCheck = sh (
                        script: "aliyun cr GET /repos/danakini/${serviceName}/tags/${alphaTag} 2>/dev/null || true",
                        returnStdout: true
                    ).trim()

                    try {
                        if (env.tagCheck.contains("NORMAL")) {
                            echo "skip build, due no changes"
                            env.dockerBuildStatus = 'SKIP'
                        } else {
                            docker.build("${imageName}", "--build-arg namespace=${alphaNS} .")
                            env.dockerBuildStatus = 'DO_BUILD'
                        }
                        currentBuild.result = 'SUCCESS'
                    } catch(e) {
                        currentBuild.result = 'FAILURE'
                        throw e
                    } finally {
                        if (currentBuild.result == "FAILURE") {
                          echo 'Build Fail'
                        }
                    }
                }
            }

        }
        stage ('Push to Docker Registry') {
            when {
                expression {
                    currentBuild.result == 'SUCCESS' && env.dockerBuildStatus == 'DO_BUILD'
                }
            }
            steps {
                script {
                    pushToRegistry("${alphaTag}")
                }
            }
        }
        stage ('Deployment to Development Environment') {
            when {
                expression {
                    currentBuild.result == 'SUCCESS' && env.alphaNS == 'development'
                }
            }
            steps {
                script {
                    doDeployment("dki-cluster", "${alphaTag}", "${alphaNS}", "1", "${serviceName}", "null")
                }
            }
        }
        stage ('Deployment to Staging Environment') {
            when {
                expression {
                    currentBuild.result == 'SUCCESS' && env.alphaNS == 'staging'
                }
            }
            steps {
                script {

                    doDeployment("dki-cluster", "${alphaTag}", "${alphaNS}", "1", "${serviceName}", "null")

                    try {
                        timeout(time: 10, unit: 'MINUTES') {
                            env.doDeployProduction = input message: 'Do you want deployment to PRODUCTION ENVIRONMENT?',
                            parameters: [choice(name: 'Production Deployment', choices: 'no\nyes', description: 'Choose "yes" if you want to deploy this build to Production')]
                        }
                        if (userChoice == 'no') {
                            echo "User refuse to deployment this build, stopping...."
                            currentBuild.result = "SUCCESS"
                        }
                    } catch(Throwable e) {
                        echo "Caught ${e.toString()}"
                        currentBuild.result = "SUCCESS"
                    }
                }
            }
        }
        stage ('Deployment to Production Environment') {
            when {
                environment name: 'doDeployProduction', value: 'yes'
            }
            steps {
                script {
                    timeout(time: 10, unit: 'MINUTES') {
                        env.releaseVersion = input (
                             id: 'version', message: 'Input version name, example v1.0.0', parameters: [
                                [$class: 'StringParameterDefinition', description: 'Whatever you type here will be your version', name: 'Version']
                            ]
                        )
                    }

                    env.releaseNS = "production"
                    env.releaseTag = sh (
                        script: "echo \"${alphaTag}\" | sed 's|${versioningCode}|${releaseVersion}|g'",
                        returnStdout: true
                    ).trim()

                    withCredentials([kubeconfigFile(credentialsId: 'dki-cluster', variable: 'KUBECONFIG')]) {
                        env.rollbackVersionLatest = sh (
                            script: """kubectl get deploy ${serviceName} -n ${releaseNS} -o wide | awk '{print \$7}' | grep -v 'IMAGES' | cut -d ':' -f2""",
                            returnStdout: true
                        ).trim()
                    }
                    sh """
                        docker pull ${crUri}:${alphaTag}
                    """
                    env.getIdDockerAlpha= sh (
                      script: """docker images | grep ${alphaTag} | awk '{print \$3}'""",
                      returnStdout: true
                    ).trim()
                    sh """
                        docker tag ${getIdDockerAlpha} ${crUri}:${releaseTag}
                    """
                    pushToRegistry("${releaseTag}")
                    doDeployment("dki-cluster", "${releaseTag}", "${releaseNS}", "1", "${serviceName}", "${rollbackVersionLatest}")

                    try {
                        timeout(time: 1, unit: 'DAYS') {
                            env.buildChoice = input message: 'Do you want to tagging / rollback this build?',
                            parameters: [choice(name: 'Action Build', choices: 'Tagging\nRollback Latest\nRollback By Version\nSkip', description: 'Choose the action build')]
                        }
                        if (buildChoice == 'skip') {
                            echo "User refused to action this build, stopping...."
                        }
                    } catch(Throwable e) {
                        echo "Caught ${e.toString()}"
                        currentBuild.result = "SUCCESS"
                    }
                }
            }
        }
        stage('Tagging Release') {
            when {
                environment name: 'buildChoice', value: 'Tagging'
            }
            steps {
                script {
                      withCredentials([string(credentialsId: 'danakini-oauth-token', variable: 'tokenGit')]) {
                          sh("git tag -a ${releaseTag} -m 'Release ${releaseTag}'")
                          sh("git push https://${tokenGit}@${gitRepository} --tags")
                      }
                }
            }
        }
        stage('Rollback Latest Deployment') {
            when {
                environment name: 'buildChoice', value: 'Rollback Latest'
            }
            steps {
                script {
                    withCredentials([kubeconfigFile(credentialsId: 'dki-cluster', variable: 'KUBECONFIG')]) {
                        sh "kubectl apply -f kubernetes/rollback/ -n ${releaseNS}"
                        sh "aliyun cr DELETE /repos/danakini/${serviceName}/tags/${releaseTag}"
                    }
                }
            }
        }
        stage('Rollback By Version') {
            when {
                environment name: 'buildChoice', value: 'Rollback By Version'
            }
            steps {
                script {
                    try {
                      timeout(time: 1, unit: 'DAYS') {
                          env.rollbackVersionInput = input (
                               id: 'version', message: 'Input version name, example v1.0.0-abcdef', parameters: [
                                  [$class: 'StringParameterDefinition', description: 'Whatever you type here will be your version', name: 'Version']
                              ]
                          )
                      }
                    } catch(Exception err) {
                        def user = err.getCauses()[0].getUser()
                        if('SYSTEM' == user.toString()) {
                            echo "timeout reason"
                            currentBuild.result = "FAILURE"
                        } else {
                            echo "Aborted by: [${user}]"
                            currentBuild.result = "SUCCESS"
                        }
                    }
                    sh "sed -i 's|$rollbackVersionLatest|$rollbackVersionInput|g' kubernetes/rollback/deployment.yaml"
                    withCredentials([kubeconfigFile(credentialsId: 'dki-cluster', variable: 'KUBECONFIG')]) {
                        sh "kubectl apply -f kubernetes/rollback/ -n ${releaseNS}"
                        sh "aliyun cr DELETE /repos/danakini/${serviceName}/tags/${releaseTag}"
                    }
                }
            }
        }
        stage('Post Build Cleaning Workspace') {
            steps {
                cleanWs()
            }
        }
    }
}
