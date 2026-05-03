output "dev_vpc_id" {
  value = module.vpc.vpc_id
}

output "dev_instance_id" {
  value = module.ec2.instance_id
}

output "dev_instance_public_ip" {
  value = module.ec2.instance_public_ip
}
