

pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('AKIAQIJRR3F2BVOW7S4P')
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