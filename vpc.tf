resource "aws_vpc" "tf-main-vpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostnames = "true"
    tags = {
        Name = "tf-main-vpc"
    }
}

# Subnets
resource "aws_subnet" "tf-main-public-subnet-1" {
    vpc_id = aws_vpc.tf-main-vpc.id
    cidr_block = "10.0.1.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1a"
    tags = {
        Name = "tf-main-public-subnet-1"
    }
}

resource "aws_subnet" "tf-main-public-subnet-2" {
    vpc_id = aws_vpc.tf-main-vpc.id
    cidr_block = "10.0.2.0/24"
    map_public_ip_on_launch = "true"
    availability_zone = "us-east-1b"
    tags = {
        Name = "tf-main-public-subnet-2"
    }
}

resource "aws_subnet" "tf-main-private-subnet-1" {
    vpc_id = aws_vpc.tf-main-vpc.id
    cidr_block = "10.0.3.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1a"
    tags = {
        Name = "tf-main-private-subnet-1"
    }
}

resource "aws_subnet" "tf-main-private-subnet-2" {
    vpc_id = aws_vpc.tf-main-vpc.id
    cidr_block = "10.0.4.0/24"
    map_public_ip_on_launch = "false"
    availability_zone = "us-east-1b"
    tags = {
        Name = "tf-main-private-subnet-2"
    }
}

