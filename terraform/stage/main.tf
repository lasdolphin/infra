terraform {
  backend "gcs" {
    bucket  = "tf-otus-devops-stage"
    path    = "terraform.tfstate"
    project = "otus-devops-179308"
    region  = "europe-west1-b"
  }
}

provider "google" {
  project = "${var.project}"
  region  = "${var.region}"
}

module "app" {
  source          = "../modules/app"
  suffix          = "${var.env}"
  public_key_path = "${var.public_key_path}"
  app_disk_image  = "${var.app_disk_image}"
}

module "db" {
  source          = "../modules/db"
  suffix          = "${var.env}"
  public_key_path = "${var.public_key_path}"
  db_disk_image   = "${var.db_disk_image}"
}

module "vpc" {
  source        = "../modules/vpc"
  suffix        = "${var.env}"
  source_ranges = ["0.0.0.0/0"]
}
