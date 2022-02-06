variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = map(string)
  default = {
    us-east-1 = "ami-0b0ea68c435eb488d"
  }
}
#---- VPCs ---------------------------------------------------------------------

 variable "region" {
     default = "us-east-1"
}
variable "availabilityZone" {
     default = "us-east-1a"
}
variable "dnsSupport" {
    default = true
}
variable "dnsHostNames" {
    default = true
}
variable "vpcCIDRblock" {
    default = "192.168.0.0/16"
}
variable "publicsCIDRblock" {
    default = "192.168.2.0/24"
}
variable "privatesCIDRblock" {
    default = "192.168.1.0/24"
}
variable "publicdestCIDRblock" {
    default = "0.0.0.0/0"
}
variable "localdestCIDRblock" {
    default = "192.168.0/16"
}
