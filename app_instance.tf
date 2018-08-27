resource "aws_instance" "app_instance" {
  ami                         = "${var.app_ami_id}"
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.public_subnet.id}"
  associate_public_ip_address = true
  security_groups             = ["${aws_security_group.app_sg.id}"]
  key_name                    = "NAT"

  tags {
    Name = "app_instance"
  }
}
