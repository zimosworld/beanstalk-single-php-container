# EB Single Container App Example Global Infrastructure
* Written using terraform

## Prerequisites

* Your AWS CLI credentials stored in your user profile
* Your Terraform Token stored in your user profile

See [here](https://www.terraform.io/docs/enterprise/free/index.html) for details on Terraform Enterprise and [here](https://app.terraform.io/signup) for setting up a free account.

## How to Use

To apply changes you will need to do the following:

* Change to this directory (environment/infrastructure/application)
* Initialize terraform
* Select the workspace
* Run apply 

### Commands

#### Terraform Initialize

```bash
terraform init
```

#### Terraform workspace

```bash
# Show the current workspace
terraform workspace show

# List all available workspaces
terraform workspace list

# Change current workspace
# [$workspace] is a place holder for the workspace name
terraform workspace select [$workspace]
```

#### Terraform apply

##### If using [Eiger](https://github.com/zimosworld/eiger) to run terraform

```bash
terraform apply
```

##### If using a locally installed version of terraform

[$env] is a place holder for the environment name

```bash
terraform apply -var-file=config/[$env].tfvars
```