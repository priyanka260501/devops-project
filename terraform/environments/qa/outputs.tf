output "qa_vpc_id" {
  value = module.vpc.vpc_id
}

output "qa_instance_id" {
  value = module.ec2.instance_id
}

output "qa_instance_public_ip" {
  value = module.ec2.instance_public_ip
}
