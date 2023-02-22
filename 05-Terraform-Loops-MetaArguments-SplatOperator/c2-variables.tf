# AWS Region
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type = string
  default = "us-east-1"  
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type = string
  default = "t3.micro"  
}

# AWS EC2 Instance Key Pair
variable "instance_keypair" {
  description = "AWS EC2 Key pair that need to be associated with EC2 Instance"
  type = string
  default = "terraform-key"
}

# AWS EC2 instance type - list
variable "instance_type_list" {
  description = "ec2 instance tyoe"
  type = list(string)
  default = ["t3.micro", "t3.small", "t3.large"]
  
}

# AWS EC2 Instance Type - Map
variable "instance_type_map" {
  description = "ec2 instance type"
  type = map(string)
  default = {
    "dev" = "t3.micro"
    "qa" = "t3.small"
    "prod" = "t3.large"
  }
  
}


