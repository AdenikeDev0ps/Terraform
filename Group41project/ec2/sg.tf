resource "aws_security_group" "pj_vpc" {
  name        = "pj_vpc"
  description = "Group41-vpc-Dev"
  vpc_id = aws_vpc.pj_vpc.id
  
  ingress {
    description      = "Allow port 22"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}