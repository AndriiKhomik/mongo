# Create a Project
resource "mongodbatlas_project" "myproject" {
  name   = var.project_name
  org_id = var.MONGODB_ATLAS_ORGANIZATION_ID
}


# Create an Atlas Cluster
resource "mongodbatlas_cluster" "mycluster" {
  name                        = var.cluster_name
  project_id                  = mongodbatlas_project.myproject.id
  provider_name               = var.provider_name
  backing_provider_name       = var.backing_provider_name
  provider_region_name        = var.provider_region_name
  provider_instance_size_name = var.provider_instance_size_name
}


# Create a Database User
resource "mongodbatlas_database_user" "bob" {
  project_id         = mongodbatlas_project.myproject.id
  username           = var.username
  password           = var.USER_PASSWORD
  auth_database_name = var.auth_database_name

  roles {
    role_name     = var.role_name
    database_name = var.database_name
  }
  depends_on = [mongodbatlas_cluster.mycluster]

}


# Open up your IP Access List to all, but this comes with significant potential risk.
locals {

  cidr_block_list = var.cidr_block_list
}

resource "mongodbatlas_project_ip_access_list" "cidr" {
  count      = length(var.cidr_block_list)
  project_id = mongodbatlas_project.myproject.id
  cidr_block = var.cidr_block_list[count.index]

  depends_on = [mongodbatlas_cluster.mycluster]
}
