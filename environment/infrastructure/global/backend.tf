#--------------------------------------------------------------
#
# Backend
#
#--------------------------------------------------------------

terraform {
  backend "remote" {
    organization = "container-testing"

    workspaces {
      name = "eb-single-container-app-global"
    }
  }
}

