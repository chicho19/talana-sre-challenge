resource "google_project_service" "gke" {
  service = "container.googleapis.com"
}

resource "google_project_service" "sql" {
  service = "sqladmin.googleapis.com"
}
