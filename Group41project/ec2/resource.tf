resource "aws_instance" "bootcamp31" {
  ami = data.aws_ami.amazonlinux2.id
  instance_type = var.instance_type
  subnet_id = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.pj_vpc.id]
  #user_data = file("${path.module}/app1-install.sh")
  key_name = var.key_pair

tags = { 
  Name = local.name
  environment = var.environment
   }
}

resource "aws_s3_bucket" "group41_s3" {
  bucket = var.aws_s3_bucket
  acl    = "private"
  versioning {
    enabled = true
  }
  tags = {
    name        = local.aws_s3_bucket  #"group41_bucket"
    environment = var.environment
  }
}

/*
resource "aws_s3_bucket" "group41_s3" {
  bucket = var.aws_s3_bucket

  tags = {
    name        = local.aws_s3_bucket  #"group41_bucket"
    environment = var.environment
  }
}

resource "aws_s3_bucket_acl" "Group41_acl" {
  bucket = aws_s3_bucket.group41_s3.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "Group41_vs" {
  bucket = aws_s3_bucket.group41_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}
*/

resource "aws_dynamodb_table" "group41_state_lock" {
  name           = var.aws_dynamodb_table  #"group41-lock-dynamo"
  read_capacity  = 3
  write_capacity = 3
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    name = "group41_lock"
  }
  lifecycle {
    prevent_destroy = false
  }
}
