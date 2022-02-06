resource "aws_instance" "LB" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = "mykey"
  private_ip = "192.168.0.11"
# associando a VPC
subnet_id = aws_subnet.pbsubnet.id
vpc_security_group_ids = [ "${aws_security_group.sclb.id}", "${aws_security_group.ssh_ws.id}", "${aws_security_group.int.id}"]
}

output "ip_LB" {
  value = aws_instance.LB.public_ip
}

resource "aws_instance" "WEB" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = "mykey"
  private_ip = "192.168.0.12"
# associando a VPC
subnet_id = aws_subnet.pbsubnet.id
vpc_security_group_ids = [ "${aws_security_group.ssh_ws.id}", "${aws_security_group.int.id}"]
}

output "ip_WEB" {
  value = aws_instance.WEB.public_ip
}

resource "aws_instance" "DB" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = "t2.micro"
  key_name = "mykey"
  private_ip = "192.168.0.13"
# associando a VPC
subnet_id = aws_subnet.pbsubnet.id
vpc_security_group_ids = [ "${aws_security_group.ssh_ws.id}", "${aws_security_group.int.id}"]
}

output "ip_DB" {
  value = aws_instance.DB.public_ip
}
