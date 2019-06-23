#--------------------------------------------------------------
#
# Network
#
#--------------------------------------------------------------

data "aws_vpc" "default" {
  tags = {
    environment = var.tag_application_environment
    identifier = var.aws_vpc_identifier
  }
}

data "aws_subnet_ids" "public_subnets" {
  vpc_id = data.aws_vpc.default.id

  tags = {
    subnet_type = "public"
  }
}

data "aws_subnet_ids" "private_subnets" {
  vpc_id = data.aws_vpc.default.id

  tags = {
    subnet_type = "private"
  }
}

data "aws_subnet_ids" "database_subnets" {
  vpc_id = data.aws_vpc.default.id

  tags = {
    subnet_type = "database"
  }
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_vpc_identifier" {
  description = "Unique identifier tag on vpc"
}

