resource "google_container_node_pool" "primary_nodes" {
  name     = "talana-node-pool"
  cluster  = google_container_cluster.gke.name
  location = var.region

  node_count = 1

  autoscaling {
    min_node_count = 1
    max_node_count = 3
  }

  node_config {
    machine_type = "e2-medium"
    disk_size_gb = 30
    disk_type    = "pd-standard"

    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]

    labels = {
      env = "challenge"
    }

    tags = ["gke-node"]
  }
}

