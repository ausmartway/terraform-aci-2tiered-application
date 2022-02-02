# Define your variables in here.

variable "tenant_id" {
  type        = string
  description = "Tenant ID from ACI"
}

variable "bridge_domain" {
  type        = string
  description = "BridgeDomain ID from ACI"
}

variable "application_name" {
  type        = string
  description = "Name of the application"
}

variable "openports" {
  default = {
    # https = {
    #   from_port = "443",
    #   to_port   = "443"
    #   protocol  = "tcp",
    # },
    # mysqldb = {
    #   from_port = "3306",
    #   to_port   = "3306",
    #   protocol  = "tcp",
    # }
  }
  description = "List of ports that should be open."
}
