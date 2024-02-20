provider "aws" {
  region = "us-east-1" # Set your desired region here
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC" # Accept a CIDR block for the VPC
}

variable "vpc_name" {
  description = "Name for the VPC" # Accept a name for the VPC
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block # Set the CIDR block for your VPC
  tags = {
    Name = var.vpc_name # Set a name for your VPC
  }
}

output "vpc_id" {
  value = aws_vpc.main.id
}

# variable "subnet_cidr_blocks" {
#   description = "CIDR blocks for the subnets" # Accept CIDR blocks for the subnets
#   type        = list(string)
# }

# variable "subnet_availability_zones" {
#   description = "Availability zones for the subnets" # Accept availability zones for the subnets
#   type        = list(string)
# }

locals {
  subnet_cidr_blocks = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

resource "aws_subnet" "public" {
  count                   = 3
  vpc_id                  = aws_vpc.main.id
  cidr_block              = local.subnet_cidr_blocks[count.index]
  availability_zone       = local.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc_name}-Subnet-${count.index + 1}"
  }
}

output "subnet_ids" {
  value = aws_subnet.public[*].id
}
