resource "google_storage_bucket" "kaeruspoon" {
  project       = "kaeruspoon-359707"
  name          = "kaeruspoon.net"
  force_destroy = false
  location      = "ASIA-NORTHEAST1"
  storage_class = "STANDARD"
}

resource "google_storage_bucket_iam_binding" "kaeruspoon_iam_binding" {
  bucket = google_storage_bucket.kaeruspoon.name
  role   = "roles/storage.legacyObjectReader"
  members = [
    "allUsers",
  ]
}
