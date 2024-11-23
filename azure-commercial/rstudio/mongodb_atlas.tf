# MongoDB Atlas Cluster

resource "mongodbatlas_cluster" "mongodb_atlas_cluster" {
  project_id   = var.mongodb_atlas_cluster_project_id
  name         = lower("mongodb-${var.location_acronym}-${var.application_acronym}-spi-${var.environment_acronym}")
  cluster_type = "REPLICASET"
  replication_specs {
    num_shards = 1
    regions_config {
      region_name     = var.mongodb_atlas_cluster_location
      electable_nodes = 3
      priority        = 7
      read_only_nodes = 0
    }
  }
  cloud_backup                 = true
  auto_scaling_disk_gb_enabled = true
  mongo_db_major_version       = var.mongodb_atlas_cluster_version

  # Provider Settings "block"
  provider_name               = "AZURE"
  provider_disk_type_name     = "P6"
  provider_instance_size_name = var.mongodb_atlas_cluster_tier_size
  
  lifecycle {
    ignore_changes = [
      snapshot_backup_policy
    ]
  }
}