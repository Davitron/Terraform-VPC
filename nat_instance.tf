resource "aws_instance" "nat_instance" {
  ami                         = "${var.nat_ami_id}"
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.public_subnet.id}"
  associate_public_ip_address = true
  source_dest_check           = false
  security_groups             = ["${aws_security_group.nat_instance_sg.id}"]
  key_name                    = "NAT"

  tags {
    Name = "nat_instance"
  }
}
