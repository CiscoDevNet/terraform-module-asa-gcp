###############
# Providers
###############
provider "google" {
  credentials = file("terraform-auth.json")
  project     = var.project_id
  region      = "us-central1"
  zone        = "us-central1-a"
}

provider "google-beta" {
  credentials = file("terraform-auth.json")
  project     = var.project_id
  region      = "us-central1"
  zone        = "us-central1-a"
}
