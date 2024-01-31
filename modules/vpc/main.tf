resource "aws_vpc" "example" {
  cidr_block       = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support = true
#   tags = var.vpc_name
}

# variable "vpc_name" {
#     default = ""
  
# }

resource "aws_security_group" "example" {
  vpc_id = aws_vpc.example.id

  // Define security group rules
}



resource "aws_subnet" "example_subnet" {
  count             = length(var.availability_zones)
  vpc_id            = aws_vpc.example.id
  cidr_block        = "10.0.${count.index}.0/24"
  availability_zone = var.availability_zones[count.index]
}