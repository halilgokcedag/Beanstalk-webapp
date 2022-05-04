variable "tier" {
  type    = string
  default = "WebServer"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "MinSize" {
  type    = number
  default = 3
}
variable "MaxSize" {
  type    = number
  default = 3
}
variable "vpc_name" {
  description = "Name of VPC"
  type        = string
  default     = "Beanstalk-demo-vpc"
}
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}
variable "vpc_azs" {
  description = "Availability zones for VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b", "us-east-1c"]
}
variable "vpc_public_subnets" {
  description = "Public subnets for VPC"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.3.0/24", "10.0.5.0/24"]
}
variable "vpc_private_subnets" {
  description = "Private subnets for VPC"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}
variable "key_name" {
  type    = string
  default = "deployer-key"
}
variable "ssh_public_key" {
  type    = string
  default = "demokey.pub"
}
variable "vpc_tags" {
  description = "Tags to apply to resources created by VPC module"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "Demo"
  }
}
