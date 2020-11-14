# ---------------------------------------------------------------------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters
# ---------------------------------------------------------------------------------------------------------------------

variable "elb_name" {
  description = "To name to use for ELB"
  type	      = string
}

variable "subnet_ids" {
  description = "The subnet IDs to deploy to"
  type        = list(string)
}

# ---------------------------------------------------------------------------------------------------------------------
# OPTIONAL PARAMETERS
# Provide some reasonable defaults
# ---------------------------------------------------------------------------------------------------------------------

variable "instance_port" {
  description = "The port for that instance listens on for requests"
  type        = string
  default     = 8080
}

variable "instance_protocol" {
  description = "The protocol that the instance expects to communicate over"
  type        = string
  default     = "http"
}

variable "lb_port" {
  description = "The port that the load balancer listens for requests"
  type        = string
  default     = 80
}

variable "lb_protocol" {
  description = "The protocol that the load balancer uses for requests"
  type        = string
  default     = "http"
}
