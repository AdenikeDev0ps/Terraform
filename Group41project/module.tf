module "ec2module" {
  source = "./ec2"
}


#Block1: ""terraform setting block""
terraform {
    required_version = ">= 1.0"
    required_providers {
        aws = {
            source = "hashicorp/aws" 
            version = "> 4.0"
        }
    }

    backend "s3" {
      bucket = "group41-bucket"
      key = "app-state/terraform.tfstate"
      region = "ca-central-1"
      dynamodb_table = "group41-lock-dynamo"
    }
}

