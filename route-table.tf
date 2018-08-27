# Declare the data source
data "aws_availability_zones" "available" {}

resource "aws_internet_gateway" "igw" {
  vpc_id = "${aws_vpc.terraformdemo.id}"

  tags {
    Name = "internet gw terraform generated"
  }
}

resource "aws_route_table" "public" {
  vpc_id = "${aws_vpc.terraformdemo.id}"

  tags {
    Name = "Public_Sub"
  }

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }
}

resource "aws_route_table" "private" {
  vpc_id = "${aws_vpc.terraformdemo.id}"

  tags {
    Name = "Private_Sub"
  }

  route {
    cidr_block  = "0.0.0.0/0"
    instance_id = "${aws_instance.nat_instance.id}"
  }
}
