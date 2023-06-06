resource "aws_internet_gateway" "tf-main-igw" {
    vpc_id = aws_vpc.tf-main-vpc.id
    tags = {
        Name = "tf-main-igw"
    }
}

# route to above aws_internet_gateway from public subnets
resource "aws_route_table" "tf-main-public-rt" {
    vpc_id = aws_vpc.tf-main-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.tf-main-igw.id
    }
    tags = {
         Name = "tf-main-public-rt"
    }
}

#route associations
resource "aws_route_table_association" "tf-main-public-assoc-1" {
    subnet_id = aws_subnet.tf-main-public-subnet-1.id
    route_table_id = aws_route_table.tf-main-public-rt.id
}

resource "aws_route_table_association" "tf-main-public-assoc-2" {
    subnet_id = aws_subnet.tf-main-public-subnet-2.id
    route_table_id = aws_route_table.tf-main-public-rt.id
}
