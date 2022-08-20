resource "google_dns_managed_zone" "kaeruspoon_net" {
  project    = "kaeruspoon-359707"
  name       = "kaeruspoon-net"
  dns_name   = "kaeruspoon.net."
  visibility = "public"
}

resource "google_dns_record_set" "kaeruspoon_net" {
  project      = "kaeruspoon-359707"
  managed_zone = google_dns_managed_zone.kaeruspoon_net.name
  name         = google_dns_managed_zone.kaeruspoon_net.dns_name
  type         = "A"
  ttl          = 300
  rrdatas = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
}

resource "google_dns_record_set" "www_kaeruspoon_net" {
  project      = "kaeruspoon-359707"
  managed_zone = google_dns_managed_zone.kaeruspoon_net.name
  name         = "www.${google_dns_managed_zone.kaeruspoon_net.dns_name}"
  type         = "CNAME"
  ttl          = 300
  rrdatas      = ["tsukasaoishi.github.io."]
}

resource "google_dns_record_set" "github_site_verification" {
  project      = "kaeruspoon-359707"
  managed_zone = google_dns_managed_zone.kaeruspoon_net.name
  name         = "_github-pages-challenge-tsukasaoishi.${google_dns_managed_zone.kaeruspoon_net.dns_name}"
  type         = "TXT"
  ttl          = 300
  rrdatas      = ["8563b688d0045332944c7117bd14a7"]
}

resource "google_dns_record_set" "google_site_verification" {
  project      = "kaeruspoon-359707"
  managed_zone = google_dns_managed_zone.kaeruspoon_net.name
  name         = google_dns_managed_zone.kaeruspoon_net.dns_name
  type         = "TXT"
  ttl          = 300
  rrdatas      = ["\"google-site-verification=2w9qQSmDA7-0jm6HfkfFqfIJ2ztaraX_3XaFaEaX4vc\""]
}
