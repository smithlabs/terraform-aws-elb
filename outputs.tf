output "elb_dns_name" {
  description = "The domain name of the load balancer"
  value       = aws_elb.elb.dns_name
}

output "elb_name" {
  description = "The name of the ELB"
  value       = aws_elb.elb.name
}

output "elb_security_group_id" {
  description = "The security group ID of the ELB cluster"
  value       = aws_security_group.elb.id
}

output "elb_zone_id" {
  description = "The zone ID of the elb"
  value       = aws_elb.elb.zone_id
}
