# ---------------------------------------------------------------------------------------------------------------------
# VERSIONING
# This project was written for Terraform 0.13.x
# See 'Upgrading to Terraform v0.13' https://www.terraform.io/upgrade-guides/0-13.html
# ---------------------------------------------------------------------------------------------------------------------

terraform {
  required_version = ">= 0.13"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE THE CLASSIC LOAD BALANCER
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_elb" "elb" {
  name            = var.elb_name
  security_groups = [aws_security_group.elb.id]
  subnets         = var.subnet_ids

  listener {
    instance_port     = var.instance_port
    instance_protocol = var.instance_protocol
    lb_port           = var.lb_port
    lb_protocol       = var.lb_protocol
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 10
    timeout             = 5
    target              = "TCP:8080"
    interval            = 10
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP THAT CONTROLS WHAT TRAFFIC CAN GO IN AND OUT OF THE ELB
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "elb" {
  name = var.elb_name
}
