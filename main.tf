provider "google" {
  project     = "otus-devops"
  region      = "europe-west1"
}

resource "google_compute_instance" "app" {
  # ...
  machine_type      = "t1-micro"
  zone              = "europe-west1-b"
  name              = "test-app"
//   tags_fingerprint  = "puma-server"
}