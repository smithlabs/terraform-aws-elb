terraform {
  required_version = ">= 0.13"
}

provider "aws" {
  region = "us-east-1"

  # Allow any 2.x version of the AWS provider
  version = "~> 2.0"
}

module "elb" {
  source = "../../"

  elb_name 	    = var.elb_name
  subnet_ids        = data.aws_subnet_ids.default.ids
}

resource "aws_security_group_rule" "allow_all_inbound" {
  type		    = "ingress"
  security_group_id  = module.elb.elb_security_group_id

  from_port	    = local.any_port
  to_port	    = local.any_port
  protocol	    = local.any_protocol
  cidr_blocks	    = local.all_ips
}

data "aws_vpc" "default" {
  default = true
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

locals {
  any_port            =  0
  any_protocol        = "-1"
  all_ips             = ["0.0.0.0/0"]
}
