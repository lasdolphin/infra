variable project {
  description = "Project ID"
}

variable region {
  description = "Region"
  default     = "europe-west1"
}

variable public_key_path {
  description = "path to publick key for ssh"
}

// variable private_key_path {
//   description = "path to privete key for ssh"
// }

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-base-app"
}

variable db_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-base-db"
}

variable env {
  description = "env suffix"
  default     = "prod"
}
