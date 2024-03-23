terraform {
  required_providers {
    postgresql = {
      source  = "cyrilgdn/postgresql"
      version = "1.22.0"
    }
  }
}
provider "postgresql" {
  alias    = "pg1"
  host     = var.host
  port     = var.port
  username = var.user
  password = var.password
  sslmode  = "disable"
}
