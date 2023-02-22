# Terraform Output Values
output "instance_publicip" {
  description = "EC2 Instance Public IP"
  value = aws_instance.myec2vm[*].public_ip
}

output "instance_publicdns" {
  description = "EC2 Instance Public DNS"
  value = aws_instance.myec2vm[*].public_dns
}

# Output - for loop with list
output "for_output_list" {
  value = "[for instance in aws_instance.myec2vm: instance.public_dns]"
  description = "for loop with list"
}

# output for loop with map
output "for_output_map1" {
  value = "{for instance in aws_instance.myec2vm: instance.id => instance.public_dns}"
  description = "for loop with map"
}

# output for loop map advanced
output "for_output_map2" {
  value = "{for c, in aws_instance.myec2vm: c => instance.public_dns}"
  description = "For Loop with Map - Advanced"
}

# Output Legacy Splat Operator (latest) - Returns the List
output "legacy_splat_instance_publicdns" {
  description = "Legacy Splat Expression"
  value = aws_instance.myec2vm.*.public_dns
}

# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized Splat Expression"
  value = aws_instance.myec2vm[*].public_dns
}