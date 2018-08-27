// Create target group for app loadbalancer
resource "aws_lb_target_group" "app_lb_tg" {
  vpc_id      = "${aws_vpc.terraformdemo.id}"
  name        = "api-lb-target-group"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
}

// Create loadbalancer for api instance
resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.app_sg.id}"]
  subnets            = ["${aws_subnet.public_subnet.id}","${aws_subnet.public_subnet_zone2.id}"]
  enable_deletion_protection = false

  tags {
    Name = "app-lb"
  }
}

// listener for loadbalancer
resource "aws_lb_listener" "app" {
  load_balancer_arn = "${aws_lb.app_lb.arn}"
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = "${aws_lb_target_group.app_lb_tg.arn}"
    type             = "forward"
  }
}

// register target group
resource "aws_lb_target_group_attachment" "app_tg_attachment" {
  target_group_arn = "${aws_lb_target_group.app_lb_tg.arn}"
  target_id        = "${aws_instance.app_instance.id}"
  port             = 80
}