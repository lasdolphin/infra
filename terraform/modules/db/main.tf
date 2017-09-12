resource "google_compute_instance" "db" {
  name         = "${var.name_db}-${var.suffix}"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags = ["${var.name_db}-${var.suffix}"]

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.db_disk_image}"
    }
  }

  metadata {
    sshKeys = "appuser:${file(var.public_key_path)}"
  }

  # определение сетевого интерфейса
  network_interface {
    # сеть, к которой присоединить данный интерфейс
    network = "default"

    # использовать ephemeral IP для доступа из Интернет
    access_config {}
  }
}

resource "google_compute_firewall" "firewall_mongo" {
  name    = "allow-mongo-${var.suffix}"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["27017"]
  }

  # правило применимо к инстансам с тегом ...
  target_tags = ["${var.name_db}-${var.suffix}"]

  # порт будет доступен только для инстансов с тегом ...
  source_tags = ["${var.name_db}-${var.suffix}"]
}
