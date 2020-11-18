resource "google_cloud_run_service" "default" {
  name     = "terraformservice"
  location = "europe-north1"
  project = "pgr301-exam"

  template {
    spec {
      containers {
        image = "eu.gcr.io/pgr301-exam/pgr301_10021/devopsexam@sha256:58c96cad23ccfa03e4f12040f0848122e21b1876d2bf1bfff217229e79150984"
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