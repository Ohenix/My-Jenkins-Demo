

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AKIAQIJRR3F2DTVRAFLE')
        AWS_SECRET_ACCESS_KEY = credentials('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')
        AWS_DEFAULT_REGION = 'eu-west-2'
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/Ohenix/My-Jenkins-Demo.git'
            }
        }
        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Terraform Apply') {
            steps {
                input 'Approve to apply?'
                sh 'terraform apply tfplan'
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}