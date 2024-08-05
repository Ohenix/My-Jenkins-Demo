

pipeline {
    agent any


    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub repository
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[
                        url: https://github.com/Ohenix/My-Jenkins-Demo.git'
                    ]]
                ])
            }
        }
        stage('Terraform Init') {
            steps {
                // Initialize Terraform
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                // Generate and show Terraform execution plan
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                // Apply the Terraform plan
                input 'Approve to apply?'
                sh 'terraform apply tfplan'
            }
        }
    }
}