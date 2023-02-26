#get the list of AZ available in a particular region
#region is set in c1-version.terraform 

data "aws_availability_zones" "myazs" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}

# Check if that respective Instance Type is supported in that Specific Region in list of availability Zones
# Get the List of Availability Zones in a Particular region where that respective Instance Type is supported

data "aws_ec2_instance_type_offerings" "my_inst_type" {
for_each = toset(data.aws_availability_zones.myazs.names)
filter {
  name = "instance-type"
  values = ["t3.micro"]
}

filter {
    name   = "location"
    values = [each.key]
  }

  location_type = "availability-zone"
}
  
# Basic Output: All Availability Zones mapped to Supported Instance Types
output "output_v3_1" {
    value = {
        for az, details in data.aws_ec2_instance_type_offerings.my_inst_type: 
        az => details.instance_types }
}

# Output-2
# Filtered Output: Exclude Unsupported Availability Zones
output "output_v3_2" {
  value = {
    for az, details in data.aws_ec2_instance_type_offerings.my_inst_type: 
    az => details.instance_types if length(details.instance_types) != 0 }
}

output "output_v3_3" {
  value = keys({ for az, details in data.aws_ec2_instance_type_offerings.my_inst_type :
  az => details.instance_types if length(details.instance_types) != 0 }) 
}