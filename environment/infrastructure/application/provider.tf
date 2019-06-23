#--------------------------------------------------------------
#
# Provider
#
#--------------------------------------------------------------

provider "aws" {
  region = var.aws_region
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

variable "tag_application_name" {
  description = "Application name tag"
}

variable "tag_application_environment" {
  description = "Application environment tag"
}

