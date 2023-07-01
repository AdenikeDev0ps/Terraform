resource "aws_vpc" "pj_vpc" {
  cidr_block = var.vpc_cidr

  tags = {
    # bootcamp project one vpc
    Name = "BCP1 VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.pj_vpc.id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.subnet_az
  map_public_ip_on_launch = "true"

  tags = {
    # bootcamp project one subnet
    Name = "public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.pj_vpc.id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.subnet_az

  tags = {
    # bootcamp project one subnet
    Name = "private Subnet"
  }
}

resource "aws_internet_gateway" "pj_igw" {
  vpc_id = aws_vpc.pj_vpc.id

  tags = {
    # bootcamp project one internet gateway
    Name = "BCP1 Internet Gateway"
  }
}

resource "aws_route_table" "pj_route_table" {
  vpc_id = aws_vpc.pj_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.pj_igw.id
  }

  tags = {
    # bootcamp project one route table
    Name = "BCP1 Route Table"
  }
}

resource "aws_route_table_association" "pj" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.pj_route_table.id
}

