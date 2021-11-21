variable "region" {
  description = "Region in AWS"
}

variable "instance_type" {
  description = "EC2 instance type"
  type = string
}

variable "ami_id" {
  description = "AMI id"
  type = string
}

variable "vpc1_id" {
  description = "VPC id"
  type = string
}

variable "internet_gateway_id" {
  description = "Gateway id"
  type = string
}

variable "key1" {
  description = "KEY"
  type = string
}

#las variables de abajo no están en el repo de guía, por lo que no se utilizarán

variable "vpc_cidr" {
  description = "VPC Main 1 CIDR"
}

variable "subnet1_cidr" {
  description = "Subnet 1 CIDR"
}

variable "subnet1_zone_1a" {
  description = "Zone 1a - Subnet 1"
}

variable "subnet1_private_ip" {
  description = "Subnet 1 Private IP"
  type = string
}

variable "username" {
  description = "Resource Owner | AWS IAM username"
  type = string
}