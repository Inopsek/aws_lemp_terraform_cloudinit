terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.6.0"
    }
  }
}

provider "aws" {
  region = var.region
}

data "template_file" "cloud-init" {
  template = file("${path.root}/cloud-init/lemp.yaml")
}

resource "aws_instance" "ubuntu_lemp" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = aws_subnet.subnet_public.id
  vpc_security_group_ids      = [aws_security_group.sg_ssh_http.id]
  associate_public_ip_address = true
  user_data                   = data.template_file.cloud-init.rendered

  tags = {
    Name = var.instance_name
  }
}

output "public_ip" {
  value = aws_instance.ubuntu_lemp.public_ip
}

output "Instruction" {
  value ="Attendre quelques minutes que l'instance soit complétement démarrée puis se rendre sur http://${aws_instance.ubuntu_lemp.public_ip}"
}
