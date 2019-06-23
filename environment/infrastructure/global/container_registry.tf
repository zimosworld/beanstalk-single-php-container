#--------------------------------------------------------------
#
# Container Registry
#
#--------------------------------------------------------------

resource "aws_ecr_repository" "default" {
    count = length(var.aws_ecr)
    name  = var.aws_ecr[count.index]["name"]

    tags = merge({
        terraform: true
    }, var.aws_ecr[count.index]["tags"])
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_ecr" {
    description = "List of ECR to create"
    type        = list(object({
        name = string
        tags = map(string)
    }))
}
