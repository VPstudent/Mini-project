variable "ssh_key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDJ7CTNu+DO7o/Dmmz/j8TcPaQKlibDNjCezdy/20sG1ixBcIeAEP0rNSLc7QHhJp373qp7ujze3yB0cYk64yrrgvvAfbZbzDNkm3DqGQ7QTIYmv8qsTYb+5BAM28cVYJQGIlaF4Oz/UjbQwoC5QG9OQocS73XM1tgzqCihLuPXFSBe7wvHgTczF1CUQQEcPzuV42uZv3QQ1oJ+Pc9XUo3vf23ZSxpTsS8ssDbAvJxX0sVIjZrpz5IuMcPIksFtk3hWJu7xAri/OzJjBfgq98aW4ItwxSQfhoyuJwXTR/LU8+woOVJrJZJ5WnfdeRkgIyGQDfMZoLm2MxD7HdEBEHYH root@centos-7-terraform.ziyotek.local"
}

variable "ingress_ports" {
  type    = list(any)
  default = [22, 80, 443]
}

variable "egress_ports" {
  type    = list(any)
  default = [8000, 8080, 8888]
}

variable "ami" {
  type = map(any)
  default = {
    us-east-1 = "ami-0c2b8ca1dad447f8a"
    us-east-2 = "ami-0443305dabd4be2bc"
    us-west-1 = "ami-04b6c97b14c54de18"
    us-west-2 = "ami-083ac7c7ecf9bb9b0"
  }
}

variable "instance" {
  type    = list(any)
  default = ["t2.micro", "t2.nano", "t2.small"]
}