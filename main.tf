provider "aws" {
    region = "eu-west-2"
  }

  # The networking for VPC
resource "aws_vpc" "Jenkins-vpc" {
  cidr_block         = "10.0.0.0/18"
  instance_tenancy   = "default"
  enable_dns_support = "true"

  tags = {
    name = "jenkins-vpc"
  }
}

# SUBNETS

resource "aws_subnet" "pub-sub"{
   vpc_id =  aws_vpc.Jenkins-vpc.id
   cidr_block = "10.0.50.0/24"
   availability_zone = "eu-west-2a"
  }

  resource "aws_subnet" "priv-sub"{
   vpc_id =  aws_vpc.Jenkins-vpc.id
   cidr_block = "10.0.60.0/24"
   availability_zone = "eu-west-2b"
  }