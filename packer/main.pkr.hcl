packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.9"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "image" {

  ami_name = local.image-name
  source_ami = var.ami_id
  instance_type = "t2.micro"
  ssh_username = "ec2-user"
  tags = {
    Name = local.image-name
	Project = var.project_name
	Env = var.project_env
  }
}

build {

  sources = ["source.amazon-ebs.image"]

  provisioner "file" {
    source = "../website"
    destination = "/tmp/"
  }

  provisioner "shell" {
    script = "./userdata.sh"
	execute_command = "sudo {{.Path}}" 
  }
 }
