provider "statuscake" {
  username = "boylan157gmailcom"
}

resource "statuscake_test" "googlecloudruntest" {
  website_name = "My test"
  website_url  = google_cloud_run_service.default.status[0].urls
  test_type    = "HTTP"
  check_rate   = 300
  contact_group   = ["195496"]
}