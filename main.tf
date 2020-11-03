terraform {
  required_version = ">= 0.13"
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE AN ELB TO ROUTE TRAFFIC ACROSS THE AUTO SCALING GROUP
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_elb" "elb" {
  name               = var.elb_name
  security_groups    = [aws_security_group.elb.id]
  subnets            = var.subnet_ids

  listener {
    instance_port      = var.instance_port
    instance_protocol  = var.instance_protocol
    lb_port            = var.lb_port
    lb_protocol        = var.lb_protocol
  }
}

# ---------------------------------------------------------------------------------------------------------------------
# CREATE A SECURITY GROUP THAT CONTROLS WHAT TRAFFIC AN GO IN AND OUT OF THE ELB
# ---------------------------------------------------------------------------------------------------------------------

resource "aws_security_group" "elb" {
  name = var.elb_name
}
