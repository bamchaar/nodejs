def buildImage() {
    echo 'Building Docker image'
    withCredentials([usernamePassword(credentialsId: 'tcdmvkey', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                  nodejs(nodeJSInstallationName: 'Node 19.8.1', configId: '<config-file-provider-id>') {
                    sh 'npm config ls'
                    sh 'npm install'
                    sh 'npm run build'
                }
    }
}
def buildJar() {
    echo 'Build mvnApp application'
    echo "Build version ${NEW_VERSION}"
    sh'mvn clean package'
}
def TestApp(){
    echo 'Testing stage'
}
def DeployApp(){
    echo 'Deploying stage'
}
def DeliverApp(){
    echo 'Deliver stage' 
    echo "Deploying version ${params.version}"
}
return this
