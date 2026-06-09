
podTemplate(cloud: 'kubernetes', containers: [
    containerTemplate(
        name: 'jnlp', 
        image: 'jenkins/inbound-agent:latest'
    ),
    containerTemplate(
        name: 'ubuntu', 
        image: 'ubuntu',
        privileged: true,
        args: '--storage-driver=vfs'
    )], 
  volumes: [
    emptyDirVolume(mountPath: '/var/lib/docker', memory: false)
  ]) {
    node(POD_LABEL) {
        def appInfo = [:]// Define shared map for extracted app information across stages
        stage('Checkout & Extract App Information') {
            container('jnlp') {
                // Ensure that work space clean
                cleanWs() 
                // Ensure we skip SSL if needed internally, then pull code
                sh 'git config --global http.sslVerify false'
                checkout scm
            }
            container('ubuntu') {
                echo "Install terraform..."
                sh  """
                wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg \
                --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
                echo "deb [arch=$(dpkg --print-architecture) \
                signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
                https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' \
                /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
                sudo apt update && sudo apt install terraform
                """            
            }
        }

        stage('Terraform Apply') {
            container('ubuntu') {
                try {
                    sh """
                    terraform init
                    terraform plan -out=apply.tfplan
                    terraform apply -input=false -auto-approve apply.tfplan > terraform-apply.log
                    """
                } finally {
                    archiveArtifacts artifacts: 'apply.tfplan, terraform-apply.log', 
                                     allowEmptyArchive: true, 
                                     fingerprint: true
                }
            }
        }

        stage('Cleanup Workspace') {
            container('alpine') {
                echo "Cleaning up workspace..."
                cleanWs(
                    cleanWhenNotBuilt: true,
                    deleteDirs: true,
                    disableDeferredWipeout: true,
                    notFailBuild: true
                )
            }
        }       
    }

}

