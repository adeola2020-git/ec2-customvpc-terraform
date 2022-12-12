# Defining the region
variable "region" {
  default = "eu-west-2"
}

# Defining CIDR Block for VPC
variable "vpc_id" {
  default = "10.0.0.0/20"
}

# Defining the instance type
variable "instance_type" {
  default = "t2.micro"
}

# Defining Key Name for connection
variable "key_name" {
  default     = "cba-web-terraform-KP"
  description = "Name of AWS Keypair"
}
# Defining CIDR Block for public subnet
variable "subnet1_cidr" {
  default = "10.0.1.0/24"
}
# Defining CIDR Block for private subnet
variable "subnet2_cidr" {
  default = "10.0.2.0/24"
}

