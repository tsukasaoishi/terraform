terraform {
  backend "gcs" {
    bucket = "kaeruspoon-tfstate"
    prefix = "terraform/state"
  }
}

resource "google_storage_bucket" "tfstate" {
  project       = "kaeruspoon-359707"
  name          = "kaeruspoon-tfstate"
  force_destroy = false
  location      = "ASIA-NORTHEAST1"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 3
    }
  }
}
