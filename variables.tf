variable "instance_name" {
  description = "Value of the name tag for the EC2 instance."
  type        = string
  default     = "Lemp_learn"
}

variable "instance_type" {
  description = "Instance_type available : [t2.micro,t3.micro]."
  type        = string
  default     = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro"], var.instance_type)
    error_message = "Instance type must be t2.micro or t3.micro."
  }
}

variable "region" {
  description = "Region of your choice."
  type        = string
  default     = "eu-west-3"
}

variable "ami" {
  description = "Ami of your choice. Need to be available in the choosed region."
  type        = string
  default     = "ami-0c6ebbd55ab05f070"

  validation {
    condition     = can(regex("^ami-", var.ami))
    error_message = "AMI value must be a valid AMI id, stating with \"ami-\"."
  }
}

variable "cidr_vpc" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.1.0.0/16"
}

variable "cidr_subnet" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.1.0.0/24"
}
