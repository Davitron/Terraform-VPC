resource "aws_subnet" "public_subnet" {
  vpc_id = "${aws_vpc.terraformdemo.id}"

  cidr_block        = "${var.public_subnet_cidr}"
  availability_zone = "us-east-2b"

  tags {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "public_subnet_zone2" {
  vpc_id = "${aws_vpc.terraformdemo.id}"

  cidr_block        = "192.168.0.32/28"
  availability_zone = "us-east-2c"

  tags {
    Name = "Public Subnet2"
  }
}

resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = "${aws_subnet.public_subnet.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "public_subnet_zone2_association" {
  subnet_id      = "${aws_subnet.public_subnet_zone2.id}"
  route_table_id = "${aws_route_table.public.id}"
}

resource "aws_subnet" "private_subnet" {
  vpc_id = "${aws_vpc.terraformdemo.id}"

  cidr_block        = "${var.private_subnet_cidr}"
  availability_zone = "us-east-2c"

  tags {
    Name = "Private Subnet"
  }
}

resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = "${aws_subnet.private_subnet.id}"
  route_table_id = "${aws_route_table.private.id}"
}
