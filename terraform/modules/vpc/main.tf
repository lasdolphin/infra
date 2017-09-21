resource "google_compute_firewall" "firewall_ssh" {
  name        = "allow-ssh-${var.suffix}"
  network     = "default"
  description = "ssh inbound rule"

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = "${var.source_ranges}"
}
