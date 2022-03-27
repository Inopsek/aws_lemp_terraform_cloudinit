# aws_lemp_terraform_cloudinit

## Purpose
Create LEMP stack on EC2 AWS instance with Terraform and Cloud-init.

## Install Instructions
```
git clone https://github.com/Inopsek/aws_lemp_terraform_cloudinit
cd aws_lemp_terraform_cloudinit
```

# How to use

You need Terraform installed and AWS CLI configured.

## Create LEMP stack on EC2 AWS instance 
```
terraform init
terraform apply
```

## Destroy ressources
```
terraform apply -destroy -auto-approve
```
