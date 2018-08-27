variable "region" {
  description = "VPC region"
  default     = "us-east-2"
}

variable "vpc_cidr" {
  description = "IPV4 CIDR for the VPC"
  default     = "192.168.0.0/21"
}

variable "public_subnet_cidr" {
  description = "IPV4 IDR for the public subnet"
  default     = "192.168.0.16/28"
}

variable "private_subnet_cidr" {
  description = "IPV4 CIDR for the private subnet"
  default     = "192.168.0.0/28"
}

variable "aws_credentials" {
  description = "where the access and secret_key are stored"
  default     = "/Users/Davitron/.aws/credentials" #change path to your credentials location
}

variable "ssh_key_name" {
  description = "name of ssh_key to use for the EC2 instances"
  default     = "demo"
}

variable "db_ami_id" {
  description = "The id for the database instance AMI"
  default = "" #add AMI Id of database here
}

variable "app_ami_id" {
  description = "The id for the application instance AMI"
  default = "" #add AMI Id for application here
}

variable "nat_ami_id" {
  description = "The id for the nat instance AMI"
  default = "" #add AMI Id for nat here
}
