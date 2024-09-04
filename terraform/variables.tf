
variable "address_prefix" {
  default = "10.0.0.0"
  # default value will be used if no value is set when calling the module or running Terraform  
}


variable "prefix" {
  default = "10.0.1.0/24"
  type = string 
}

variable "sub-2" {
  type = string
  default = "10.0.2.0/24"
  
}

variable "vnet-2" {
  default = "16.8.0.0"
}