terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = "5.25.0"
    }
  }
}


# ----------------------------------------------------------------------------- vpc
resource "aws_vpc" "vpc" {
  cidr_block = "10.${var.vpc_cidr_block_offset}.0.0/16"
  instance_tenancy = var.vpc_instance_tenancy
  tags = {Name = "${var.vpc_glevel_name_prefix}-vpc"}
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {Name = "${var.vpc_glevel_name_prefix}-igw"}
}
