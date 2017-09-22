variable public_key_path {
  description = "path to publick key for ssh"
}

// variable private_key_path {
//   description = "path to publick key for ssh"
// }

variable app_disk_image {
  description = "Disk image for reddit app"
  default     = "reddit-base-app"
}

variable name_app {
  description = "Machine name"
  default = "reddit-app"
}

variable suffix {
    description = "prod/stage suffix"
    default = "default"
}
