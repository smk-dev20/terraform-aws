resource "aws_eip" "nat" {
    domain = "vpc"
}

resource "aws_nat_gateway" "tf-nat-gw" {
    allocation_id = aws_eip.nat.id
    subnet_id = aws_subnet.tf-main-public-subnet-1.id
    depends_on = [aws_internet_gateway.tf-main-igw]
}

# route table for private subnet
resource "aws_route_table" "tf-main-private-rt" {
    vpc_id = aws_vpc.tf-main-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.tf-nat-gw.id
    }
    tags = {
        Name = "tf-nat-gw"
    }
}

resource "aws_route_table_association" "tf-main-private-assoc-1" {
    subnet_id = aws_subnet.tf-main-private-subnet-1.id
    route_table_id = aws_route_table.tf-main-private-rt.id
}

resource "aws_route_table_association" "tf-main-private-assoc-2" {
    subnet_id = aws_subnet.tf-main-private-subnet-2.id
    route_table_id = aws_route_table.tf-main-private-rt.id
}