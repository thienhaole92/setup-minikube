resource "postgresql_database" "my_db1" {
  provider = postgresql.pg1
  name     = "my_db1"
}

resource "postgresql_role" "my_role" {
  provider = postgresql.pg1
  name     = "my_role"
  login    = true
  password = "mypass"
}
