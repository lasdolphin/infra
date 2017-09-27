resource "google_compute_instance" "app" {
  name         = "reddit-app-${var.suffix}"
  machine_type = "g1-small"
  zone         = "europe-west1-b"
  tags =  ["reddit-app-${var.suffix}", "reddit-app-nginx-${var.suffix}"]

  # определение загрузочного диска
  boot_disk {
    initialize_params {
      image = "${var.app_disk_image}"
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
    access_config {
      // nat_ip = "${google_compute_address.app_ip.address}"
    }
  }
}

// resource "google_compute_address" "app_ip" {
//   name = "reddit-app-ip-${var.suffix}"
// }

resource "google_compute_firewall" "firewall_puma" {
  name = "allow-puma-${var.suffix}"

  # Название сети, в которой действует правило
  network = "default"

  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["9292"]
  }

  # Каким адресам разрешаем доступ
  source_ranges = ["127.0.0.1/32"]

  # Правило применимо для инстансов с тегом ...
  target_tags = ["reddit-app-${var.suffix}"]
}

resource "google_compute_firewall" "firewall_nginx" {
  name = "allow-nginx-${var.suffix}"

  # Название сети, в которой действует правило
  network = "default"

  # Какой доступ разрешить
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  # Каким адресам разрешаем доступ
  source_ranges = ["0.0.0.0/0"]

  # Правило применимо для инстансов с тегом ...
  target_tags = ["reddit-app-nginx-${var.suffix}"]
}
