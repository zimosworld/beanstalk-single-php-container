#--------------------------------------------------------------
#
# Provider
#
#--------------------------------------------------------------

provider "aws" {
  region = var.aws_region
  version = "~> 2.7"
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_region" {
  description = "Region for the VPC"
}

variable "aws_role" {
  description = "Role Switch ARN"
}

