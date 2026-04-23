variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR para la VPC"
  type        = string
}

variable "subnet_cidr" {
  description = "CIDR para la Subnet"
  type        = string
}

variable "ami_id" {
  description = "ID de la AMI"
  type        = string
}

variable "instance_type" {
  description = "Tipo de instancia"
  type        = string
}
variable "az" {
  type        = string
  description = "Zona de disponibilidad para la Subnet"
}
