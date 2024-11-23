resource "mongodbatlas_database_user" "gurobi_user" {
  username           = var.mongodb_user
  password           = var.mongodb_user_password
  project_id         = var.mongodb_atlas_cluster_project_id
  auth_database_name = "admin"

  roles {
    role_name     = "readWriteAnyDatabase"
    database_name = "admin"
  }

}