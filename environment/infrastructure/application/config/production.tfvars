#--------------------------------------------------------------
# General
#--------------------------------------------------------------

aws_region = "ap-southeast-2"

tag_application_name        = "eb-single-container-app"
tag_application_environment = "production"

#--------------------------------------------------------------
# Network
#--------------------------------------------------------------

aws_vpc_identifier = "2fH8nZ"

#--------------------------------------------------------------
# Database
#--------------------------------------------------------------

aws_rds = [
  {
    storage_type              = "gp2"
    allocated_storage         = "20"
    engine                    = "mariadb"
    engine_version            = "10.3"
    instance                  = "db.t3.micro"
    identifier                = "eb-single-container-db-production"
    db_name                   = "eb-db"
    username                  = "master"
    parameter_group_name      = "default.mariadb10.3"
    db_subnet_group_name      = "sct-production"
    tags                      = {}
  }
]

#--------------------------------------------------------------
# Beanstalk application
#--------------------------------------------------------------

aws_beanstalk_environment = {
  name                   = "eb-single-container-app-production"
  description            = "EB Single Container App Production"
  application_name       = "EB Single Container App"
  ssh_key_name           = "sct-key"
  tags                   = {
    APP_ENV: "production"
    APP_NAME: "eb-single-container-app"
    BUILD_CONFIG_BUCKET: ""
  }
  solution_stack         = "running Docker"
  logs_retention_in_days = "30"
  instance_type          = "t3.micro"
  ssh_source_restriction = "172.31.0.0/20"
  enable_ssl             = false
  healthcheck_url        = "/health.php"
}