# Terraform and Bitbucket Pipelines Example
This is an example using terraform to deploy AWS infrastructure (Beanstalk) and Bitbucket pipelines to build and deploy a docker image with AWS ECR. 

## Terraform

In this example Terraform is spill up into global and application.

### Global

Global handles infrastructure that is shared between multiple applications or environments.

Example
- A Production VPC mite hold three different websites that are managed in three separate repos.
- Or ECR which is used for one application but all environments (production and staging)

Global is run once overall and will setup:

- Beanstalk application for "EB Single Container App"
- ECR (Docker Registry)
- S3 Bucket
- SSH Key
- VPC for Production environments
- VPC for Staging environments

Path: `environment/infrastructure/global`.

### Application

Application handles infrastructure related only to that applications environment.

Example
- Each application and environment will have its own database
- Each application and environment will have its own Beanstalk instance

Application is run for each environment and will setup for each environment:

- Beanstalk Environment
- MariaDB Instance
 
Path: `environment/infrastructure/application`

### Setup

- Run terraform commands* for Global.
- Get the S3 bucket name for the builds bucket and put into application tfvar files for beanstalk tag `BUILD_CONFIG_BUCKET`
- Run terraform commands* for each Application environment.

*See readme in global/application folder for commands. 

## Bitbucket Pipelines

### Process

The pipelines steps/process in this example will:

- Run `composer install` within the application directory
- Build a docker image and push it to AWS ECR based on the config in `environment/containers/production/eb_single_php_container_app`
- Make a Beanstalk version, upload it to S3 and register with Beanstalk using the configs in `environment/artifact`
- Allow you to deploy to Staging environment, then to Production

### Require Environment Variables

Required environment variables that need to be added in BitBucket for the pipelines to run correctly.

The AWS Access Key used here will require write access to a bucket to store Beanstalk versions and read/write access to AWS ECR.

|Name|Description|Example|
|----|-----------|-------|
|AWS_ACCESS_KEY_ID|AWS access key associated with an IAM user or role.|AKIAIOSFODNN7EXAMPLE|
|AWS_SECRET_ACCESS_KEY|Secret key associated with the access key.|wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY|
|AWS_DEFAULT_REGION|AWS Region to send the request to.|ap-southeast-2|
|DOCKER_IMAGE_URL|AWS ECR URI for your image|111111111111.dkr.ecr.ap-southeast-2.amazonaws.com/sct|
|BUILD_BUCKET|S3 Bucket name where builds will be stored|ct-builds-configs20190605042428563200000001|
|BUILD_PATH|Path in S3 Bucket to store builds|builds/sct|
|APP_NAME|AWS Beanstalk application name to register version with|EB Single Container App|
|APP_ENV_STAGING|AWS Beanstalk application environment name for Staging|eb-single-container-app-staging|
|APP_ENV_PRODUCTION|AWS Beanstalk application environment name for Production|eb-single-container-app-production|

## Local Setup

- Setup [Traefik](https://hub.docker.com/_/traefik)
- Run `docker-compose up -d`
- Add host hack (127.0.0.1 local.eb.test.com)