#--------------------------------------------------------------
#
# Global Terraform Varaiables
#
#--------------------------------------------------------------

#--------------------------------------------------------------
# General
#--------------------------------------------------------------

aws_region            = "ap-southeast-2"

#--------------------------------------------------------------
# VPC
#--------------------------------------------------------------

aws_vpc_production = {
  name = "sct-production"
  cidr = "10.0.16.0/20"
  availability_zones = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  public_subnets = ["10.0.16.0/24", "10.0.19.0/24", "10.0.22.0/24"]
  private_subnets = ["10.0.17.0/24", "10.0.20.0/24", "10.0.23.0/24"]
  database_subnets = ["10.0.18.0/24", "10.0.21.0/24", "10.0.24.0/24"]
  enable_nat_gateway = false
  single_nat_gateway = true
  public_subnet_tags = { subnet_type = "public" }
  private_subnet_tags = { subnet_type = "private" }
  database_subnet_tags = { subnet_type = "database" }
  tags = {}
  vpc_tags = {
    environment = "production"
    identifier = "2fH8nZ"
  }
}

aws_vpc_staging = {
  name = "sct-staging"
  cidr = "10.0.32.0/20"
  availability_zones = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
  public_subnets = ["10.0.32.0/24", "10.0.35.0/24", "10.0.38.0/24"]
  private_subnets = ["10.0.33.0/24", "10.0.36.0/24", "10.0.39.0/24"]
  database_subnets = ["10.0.34.0/24", "10.0.37.0/24", "10.0.40.0/24"]
  enable_nat_gateway = false
  single_nat_gateway = true
  public_subnet_tags = { subnet_type = "public" }
  private_subnet_tags = { subnet_type = "private" }
  database_subnet_tags = { subnet_type = "database" }
  tags = {}
  vpc_tags = {
    environment = "staging"
    identifier = "scSJ8p"
  }
}


#--------------------------------------------------------------
# Beanstalk Apps
#--------------------------------------------------------------

aws_beanstalk_apps = [
  {
    name = "EB Single Container App"
    description = "EB Single Container App Example"
  }
]

#--------------------------------------------------------------
# S3 Buckets
#--------------------------------------------------------------

aws_s3_buckets = [
  {
    name_prefix = "ct-builds-configs"
    acl         = "private"
    tags        = {}
  }
]

#--------------------------------------------------------------
# SSH Key
#--------------------------------------------------------------

aws_ssh_key_name = "sct-key"
aws_ssh_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC+AJcQTPZd1ar5CXynmpDteezoNIEWtWByWu4SBz+me67sr7QEPp8SGPjT4zJNgtLSgIkr+4d1UUTEhiUEyURwkk+959lt8DEUSPAmYRsLZ7WdvA1Ov35lojlDY0vNQsNtiEesfV9t1+0RwcHkgzFDPDEj+KzA8MebuZYcynvVQ8N/3d0tpvO8VtWLC5zWXE2y528lW4gfMDvlJihY4kT4z2igEvXYL0cfJf1+GJ48fRPfF4rXow91tzeqglqgJbhW/gmnPjCy8lIYkB1QANZHzyNCpV/e/xUt3bQAn4on1GxV5ySTFeypu05WOiT2uvEEI6azge3wSDJdjLWqp25R"

