variable public_key_path {
  description = "path to publick key for ssh"
}

// variable private_key_path {
//   description = "path to publick key for ssh"
// }

variable db_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-base-db"
}
variable name_db {
  description = "Machine name"
  default = "reddit-db"
}

variable suffix {
    description = "prod/stage suffix"
    default = "default"
}