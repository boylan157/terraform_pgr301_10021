resource "google_cloud_run_service" "default" {
  name     = "terraformservice"
  location = "europe-north1"
  project = "pgr301-exam"

  template {
    spec {
      containers {
        image = "eu.gcr.io/pgr301-exam/pgr301_10021/devopsexam@sha256:4dceeb0f8f668b5351333bfc7f543a1c5500f267db61143738e066c66d3d3fc5"
        env {
          name = "LOGZ_TOKEN"
          value = var.logz_token
        }
      }
    }
  }
//
  traffic {
    percent = 100
    latest_revision = true
  }
}

data "google_iam_policy" "noauth" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "noauth" {
  location    = google_cloud_run_service.default.location
  project     = google_cloud_run_service.default.project
  service     = google_cloud_run_service.default.name

  policy_data = data.google_iam_policy.noauth.policy_data
}