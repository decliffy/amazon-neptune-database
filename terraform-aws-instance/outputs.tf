output "instance_public_ip" {
  description = "EC2 instance allocated public ip address"
  value       = resource.aws_instance.neptune_ec2_instance.public_ip
}

output "ec2_instance_ingress_sgid" {
  description = "EC2 ingress security group"
  value       = resource.aws_security_group.ec2_connect_sg.id
}
