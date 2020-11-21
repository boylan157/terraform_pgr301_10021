terraform {
  backend "gcs" {
    bucket = "terraform-bucket-pgr301"
    prefix = "terraformstate"
    credentials = "pgr301-exam-ad93aab2bdd9.json"
  }
}

provider "google-beta" {
  credentials = file("pgr301-exam-ad93aab2bdd9.json")
  project     = "terraform-292215"
  version = "~> 3.0.0-beta.1"
}