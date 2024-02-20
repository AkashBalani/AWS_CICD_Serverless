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
