variable "region" {
    description = "The aws region"
    type = string
    default = "ca-central-1"
}

variable "ami" {
    description = "The aws ami"
    type = string
    default = "ami-097bd6037de54b1dc"
}

variable "instance_type" {
    description = "The ec2 instance type"
    type = string
    default = "t2.micro"
}

variable "key_pair" {
    description = "The ec2 key pair"
    type = string
    default = "Newkey"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "192.168.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "192.168.10.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "192.168.20.0/28"
}

variable "aws_s3_bucket" {
    description = "The s3 bucket"
    type = string
    default = "group41-bucket"
}

variable "environment" {
    description = "environment"
    type = string
    default = "dev"
}

variable "aws_dynamodb_table" {  #"aws_s3_bucket_dynamodb"
    description = "bucket dynamodb"
    type = string
    default = "group41-lock-dynamo"
}

variable "subnet_az" {
    description = "az for subnet"
    type = string
    default = "ca-central-1a"
}


