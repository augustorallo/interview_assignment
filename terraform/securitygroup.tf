resource "aws_security_group" "sclb" {
  vpc_id      = aws_vpc.vpc1.id
  name        = "sclb"
  description = "Acesso da WS para a LB http"
  egress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["13.48.23.63/32"]
}
  tags = {
    Name = "sclb"
  }
}

resource "aws_security_group" "ssh_ws" {
  vpc_id      = aws_vpc.vpc1.id
  name        = "ssh_ws"
  description = "Acesso da WS para ssh"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["13.48.23.63/32"]
  }

  tags = {
    Name = "ssh_ws"
  }
}


#permitindo acesso entre as máquinas livremente

resource "aws_security_group" "int" {
  vpc_id      = aws_vpc.vpc1.id
  name        = "int"
  description = "trafego interno"
  egress {
    from_port = 0
    to_port = 0
    protocol = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
  from_port   = 0
  to_port     = 0
  protocol    = "all"
  cidr_blocks = ["192.168.0.0/16"]
}
  tags = {
    Name = "int"
  }
}
