resource "aws_vpc" "vpc1" {
  cidr_block           = var.vpcCIDRblock
  instance_tenancy     = "default"
  enable_dns_support   = var.dnsSupport
  enable_dns_hostnames = var.dnsHostNames
tags = {
    Name = "vpc1"
}
}

# declarando subnets:

resource "aws_subnet" "pbsubnet" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = var.publicsCIDRblock
  map_public_ip_on_launch = "true"
  availability_zone       = var.availabilityZone
tags = {
   Name = "pbsubnet"
}
}


#criando o gateway da internet para a LB --------------------------

resource "aws_internet_gateway" "gw1" {
 vpc_id = aws_vpc.vpc1.id
 tags = {
        Name = "gw1"
}
}

# Rotas para acesso da internet

resource "aws_route" "internet_access" {
  route_table_id         = aws_route_table.publicroute.id
  destination_cidr_block = var.publicdestCIDRblock
  gateway_id             = aws_internet_gateway.gw1.id
}

resource "aws_route_table" "publicroute" {
 vpc_id = aws_vpc.vpc1.id
  route {
    cidr_block = var.publicdestCIDRblock
    gateway_id = aws_internet_gateway.gw1.id
  }

 tags = {
        Name = "publicroute"
}
}

resource "aws_route_table_association" "Public_association" {
  subnet_id      = aws_subnet.pbsubnet.id
  route_table_id = aws_route_table.publicroute.id
}
