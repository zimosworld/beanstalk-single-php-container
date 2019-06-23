#--------------------------------------------------------------
#
# Backend
#
#--------------------------------------------------------------

terraform {
  backend "remote" {
    // Values in backend can not be variables
    organization = "container-testing"

    workspaces {
      prefix = "eb-single-container-app-"
    }
  }
}

