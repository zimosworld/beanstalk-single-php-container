#--------------------------------------------------------------
#
# Beanstalk Environment
#
#--------------------------------------------------------------

module "elastic_beanstalk_environment" {
  source = "git::https://github.com/zimosworld/terraform-aws-beanstalk-clb.git?ref=0.0.5"

  name        = var.aws_beanstalk_environment["name"]
  description = var.aws_beanstalk_environment["description"]

  application     = var.aws_beanstalk_environment["application_name"]
  vpc_id          = data.aws_vpc.default.id
  private_subnets = data.aws_subnet_ids.private_subnets.ids
  public_subnets  = data.aws_subnet_ids.public_subnets.ids
  keypair         = var.aws_beanstalk_environment["ssh_key_name"]
  env_vars        = var.aws_beanstalk_environment["env_vars"]

  solution_stack           = var.aws_beanstalk_environment["solution_stack"]
  logs_retention_in_days   = var.aws_beanstalk_environment["logs_retention_in_days"]
  instance_type            = var.aws_beanstalk_environment["instance_type"]
  ssh_source_restriction   = var.aws_beanstalk_environment["ssh_source_restriction"]
  clb_ssl_listener_enabled = var.aws_beanstalk_environment["enable_ssl"]
  #clb_ssl_listener_certificate_arn = "${aws_acm_certificate.default.arn}"
  healthcheck_url          = var.aws_beanstalk_environment["healthcheck_url"]

  tags = merge({
    terraform   = "true"
    application = var.tag_application_name
    environment = var.tag_application_environment
  }, var.aws_beanstalk_environment["tags"])
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_beanstalk_environment" {
  description = "Map of Elastic Beanstalk configs"
  type = object({
    name                   = string
    description            = string
    application_name       = string
    ssh_key_name           = string
    tags                   = map(string)
    env_vars               = map(string)
    solution_stack         = string
    logs_retention_in_days = string
    instance_type          = string
    ssh_source_restriction = string
    enable_ssl             = bool
    healthcheck_url        = string
  })
}
