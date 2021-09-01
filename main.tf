resource "aws_key_pair" "my-key" {
  key_name   = "devops14_2021"
  public_key = var.ssh_key
}

resource "aws_eip" "my_eip" {
  vpc = true
  tags = {
    name  = "devops14_2021"
    Owner = "Vadim"
  }
}

output "eip" {
  value = aws_eip.my_eip.public_ip
}


resource "aws_security_group" "dynamic-sg" {
  name = "devops14_2021"
  dynamic "ingress" {
    for_each = var.ingress_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    for_each = var.egress_ports
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}


resource "aws_instance" "devops14_2021" {
  ami             = lookup(var.ami, "us-east-2")
  instance_type   = var.instance[0]
  key_name        = aws_key_pair.my-key.key_name
  tags = {
    Name = "devops14_2021"
  }
}

resource "aws_network_interface_sg_attachment" "sg_attachment" {
  security_group_id    = aws_security_group.dynamic-sg.id
  network_interface_id = aws_instance.devops14_2021.primary_network_interface_id
}