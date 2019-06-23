#--------------------------------------------------------------
#
# Database
#
#--------------------------------------------------------------
resource "random_string" "database_password" {
  length  = 21
  special = false
}

resource "aws_db_instance" "default" {
  count = length(var.aws_rds)

  allocated_storage    = var.aws_rds[count.index]["allocated_storage"]
  storage_type         = var.aws_rds[count.index]["storage_type"]
  engine               = var.aws_rds[count.index]["engine"]
  engine_version       = var.aws_rds[count.index]["engine_version"]
  instance_class       = var.aws_rds[count.index]["instance"]
  identifier           = var.aws_rds[count.index]["identifier"]
  name                 = var.aws_rds[count.index]["db_name"]
  username             = var.aws_rds[count.index]["username"]
  password             = random_string.database_password.result
  parameter_group_name = var.aws_rds[count.index]["parameter_group_name"]
  db_subnet_group_name = var.aws_rds[count.index]["db_subnet_group_name"]

  tags = merge({
    terraform   = "true"
    application = var.tag_application_name
    environment = var.tag_application_environment
  }, var.aws_rds[count.index]["tags"])

  lifecycle {
    ignore_changes = [
      password]
  }
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_rds" {
  description = "List of RDS configs"
  type        = list(object({
    storage_type         = string
    allocated_storage    = string
    engine               = string
    engine_version       = string
    instance             = string
    identifier           = string
    db_name              = string
    username             = string
    parameter_group_name = string
    db_subnet_group_name = string
    tags                 = map(string)
  }))
}
