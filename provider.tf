provider "aws" {
  shared_credentials_file = "${var.aws_credentials}"
  region                  = "${var.region}"
}

resource "aws_vpc" "terraformdemo" {
  cidr_block           = "${var.vpc_cidr}"
  enable_dns_hostnames = true

  tags {
    Name = "evento-vpc"
  }
}
