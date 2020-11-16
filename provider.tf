provider "google-beta" {
  credentials = file("pgr301-exam-b0bef1aea48c.json")
  project     = "terraform-292215"
  version = "~> 3.0.0-beta.1"
}