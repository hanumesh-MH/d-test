
terraform {
  required_version = ">= 0.11.1"

  backend "s3" {
    encrypt = "true"
  }
}

# aws provider
provider "aws" {
  region = "us-east-2"
}

# fetching coreos AMI
data "aws_ami" "coreos" {
  filter {
    name   = "name"
    values = ["CoreOS-stable-1576.4.0-hvm"] 
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["595879546273"] # CoreOS
}


variable "public_key_path" {
  default = "~/.ssh/3-tier.pub"
}


variable "key_name" {
  default = "guilherme-ssh-key"
}


variable "instance_type" {
  default = "t2.micro"
}
