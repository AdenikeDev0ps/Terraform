output "instance_id" {
    value = aws_instance.bootcamp31.id
}

output "s3_bucket_id" {
  description = "The name of the bucket."
  value = aws_s3_bucket.group41_s3.id
}


output "public_ip" {
    description = "ec2 instance public ip"
    value = aws_instance.bootcamp31.public_ip
}

output "az" {
    description = "ec2 instance availability zone"
    value = aws_instance.bootcamp31.availability_zone
}