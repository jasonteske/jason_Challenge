SRE Infra as Code Challenge for Comcast

## Description

Uses terraform to stand up an ec2 instance, install and configure httpd, create and configure the security group for access, assigns a key to the instance, generates an ssl certificate and puts it in place, and comes with a monitoring script intended to be set up with an email provider and run as a cron

## Prerequisites

terraform
AWS cli credentials

## Usage

Must obtain AWS CLI key and secret then put them in the providers.tf file prior to usage

terraform init ## In order to reduce package size, the terraform providers in .terraform were removed from the repository so init must be ran to download them
terraform plan -out tfplan.out -> Plan before application
terraform apply tfplan.out -> Generate infrastructure

## Issues and Conclusions

1) Intended initially to use Terraform File Provisioners to push out the virtualhost, ssl and other files however Terraform indicates that this should only be used as a last resort (https://developer.hashicorp.com/terraform/language/resources/provisioners/file). Instead, I used the bootstrap.sh file and echo/cat to configure the files on the server. I'm using a free AWS account however in a organization I would rather have put these files in S3 and then had terraform download them and put them in place, as well as the credentials

2) A keypair is generated and assigned to the instance, and ssh port 22 additionally opened in the security group on creation

3) The SSL certificate is self signed so will still show a warning

4) The monitoring file provided is not fully functional without an email provider and smtp credentials. It's intended usage would be for via cron or some other job system, continuous monitoring of the application and an email alert if the website is not returning a 200

