#--------------------------------------------------------------
#
# S3 Bucket
#
#--------------------------------------------------------------

resource "aws_s3_bucket" "default" {
  count = length(var.aws_s3_buckets)

  bucket_prefix = var.aws_s3_buckets[count.index]["name_prefix"]
  acl           = var.aws_s3_buckets[count.index]["acl"]

  tags = merge({
    terraform   = "true"
    environment = "global"
  }, var.aws_s3_buckets[count.index]["tags"])
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_s3_buckets" {
  description = "List of objects for buckets with settings to create"
  type        = list(object({
    name_prefix = string
    acl         = string
    tags        = map(string)
  }))
}