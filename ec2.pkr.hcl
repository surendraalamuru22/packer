packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ec2" {
  ami_name      = "centos-golden-image"
  instance_type = "t3.small"
  region        = "us-west-1"
  source_ami_filter {
    filters = {
      name                = "Centos-8-DevOps-Practice"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["973714476881"]
  }
  ssh_username = "centos"
  ssh_password = "DevOps321"
}

build {
  sources = [
    "source.amazon-ebs.ec2"
  ]

  provisioner "shell" {
    inline = [
      "sudo labauto ansible"
    ]
  }
}
