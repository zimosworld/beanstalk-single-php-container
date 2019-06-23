#--------------------------------------------------------------
#
# AWS VPC
#
#--------------------------------------------------------------

module "vpc-staging" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.aws_vpc_staging["name"]
  cidr = var.aws_vpc_staging["cidr"]

  azs              = var.aws_vpc_staging["availability_zones"]
  public_subnets   = var.aws_vpc_staging["public_subnets"]
  private_subnets  = var.aws_vpc_staging["private_subnets"]
  database_subnets = var.aws_vpc_staging["database_subnets"]

  enable_nat_gateway = var.aws_vpc_staging["enable_nat_gateway"]
  single_nat_gateway = var.aws_vpc_staging["single_nat_gateway"]

  public_subnet_tags   = var.aws_vpc_staging["public_subnet_tags"]
  private_subnet_tags  = var.aws_vpc_staging["private_subnet_tags"]
  database_subnet_tags = var.aws_vpc_staging["database_subnet_tags"]

  tags = merge({
    terraform   = "true"
  }, var.aws_vpc_staging["tags"])

  vpc_tags = var.aws_vpc_staging["vpc_tags"]
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_vpc_staging" {
  description = "Object with VPC settings"
  type = object({
    name                 = string
    cidr                 = string
    availability_zones   = list(string)
    public_subnets       = list(string)
    private_subnets      = list(string)
    database_subnets     = list(string)
    enable_nat_gateway   = bool
    single_nat_gateway   = bool
    public_subnet_tags   = map(string)
    private_subnet_tags  = map(string)
    database_subnet_tags = map(string)
    tags                 = map(string)
    vpc_tags             = map(string)
  })
}