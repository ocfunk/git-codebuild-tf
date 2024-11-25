provider "aws" {
  profile = "Oliver_TF"
  region  = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket  = "oliver-tf-251124"
    key     = "terraform.tfstate"
    region  = "eu-central-1"
    profile = "Oliver_TF"
  }
}


module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"

  name            = "Oliver-VPC"
  cidr            = "10.0.0.0/16"
  azs             = ["eu-central-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  public_subnet_tags = {
    Name = "Oliver-Public-Subnet"
  }
  private_subnet_tags = {
    Name = "OLiver-Private-Subnet"
  }
  tags = {
    Owner = "Oliver"
  }
}


