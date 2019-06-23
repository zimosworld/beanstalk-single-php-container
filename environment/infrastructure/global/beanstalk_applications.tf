#--------------------------------------------------------------
#
# Beanstalk Applications
#
#--------------------------------------------------------------

resource "aws_elastic_beanstalk_application" "default" {
  count = length(var.aws_beanstalk_apps)

  name        = var.aws_beanstalk_apps[count.index]["name"]
  description = var.aws_beanstalk_apps[count.index]["description"]
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_beanstalk_apps" {
  description = "List of Beanstalk Applications for create"
  type        = list(object({
    name: string
    description: string
  }))
}