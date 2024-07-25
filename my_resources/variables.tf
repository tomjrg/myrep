#Data from terraform.tfvars file

variable "tenancy_ocid" {}
variable "compartment_ocid" {}
variable "ssh_public_key" {}

#Choose an Availability Domain "AD"

variable "AD" {
  default = "1"
}

#VCN variables

variable "vcn_cidr" {
  default = "10.0.0.0/16"
}

variable "vcn_dns_label" {
  description = "vcn dns label"
  default = "vcn01"
}

variable "dns_label" {
  description = "subnet dns label"
  default = "subnet"
}

#OS image

variable "image_operating_system" {
  default = "Oracle Linux"
}

variable "image_operating_system_version" {
  default = "7.9"
}

#Compute Shape

variable "instance_shape" {
  description = "instance shape"
  default = "VM.Standard.E2.1.Micro"
}

#Load balancer shape

variable "load_balancer_min_band" {
  description = "load balancer min band"
  default = "10"
}

variable "load_balancer_max_band" {
  description = "load balancer max band"
  default = "10"
}

variable "shape" {
  description = "Load Balancer Shape"
  type        = string
  default     = "100Mbps"
}

#user data
variable "user_data" {
  type    = string
  default = <<-EOF
    #!/bin/bash
    echo "Hello, World!" > /var/www/html/index.html
    # Add more initialization commands here
  EOF
}
