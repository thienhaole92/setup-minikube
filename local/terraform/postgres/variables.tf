variable "host" {
  description = "The address for the postgresql server connection"
  type        = string
}

variable "user" {
  description = "Username for the server connection"
  type        = string
}
variable "password" {
  description = "Password for the server connection"
  type        = string
}

variable "port" {
  description = "The port for the postgresql server connection. The default is 5432"
  type        = number
  default     = 5432
}
