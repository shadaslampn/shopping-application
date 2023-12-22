variable "project_name" {
  type        = string
  description = "name of the project"
}

variable "project_env" {
  type        = string
  description = "project environment"
}

variable "ami_id" {
  type        = string
  description = "source ami id"
}

locals {
  image-timestamp = "${formatdate("DD-MM-YYYY-hh-mm", timestamp())}"
  image-name = "${var.project_name}-${var.project_env}-${local.image-timestamp}"
}
