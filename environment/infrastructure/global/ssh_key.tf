#--------------------------------------------------------------
#
# AWS SSH Key
#
#--------------------------------------------------------------

resource "aws_key_pair" "ssh-key" {
  key_name   = var.aws_ssh_key_name
  public_key = var.aws_ssh_key
}

#--------------------------------------------------------------
# Variables
#--------------------------------------------------------------

variable "aws_ssh_key_name" {
  description = "SSH Key Name"
}

variable "aws_ssh_key" {
  description = "SSH Key"
}

