resource "aws_instance" "db_instance" {
  ami                         = "${var.db_ami_id}"
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.private_subnet.id}"
  private_ip                  = "192.168.0.13"
  associate_public_ip_address = false
  security_groups             = ["${aws_security_group.db_instance_sg.id}"]
  key_name                    = "NAT"

  tags {
    Name = "database_instance"
  }
}
