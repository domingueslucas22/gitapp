variable "aws_region" {
  type    = string
  default = "ap-southeast-2"
}

variable "project_name" {
  type    = string
  default = "lucasapp"
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "owner" {
  type    = string
  default = "Lucas"
}

variable "docker_image" {
  type    = string
  default = "lukinhas22/lucasapp"
}

# Deploy por tag imutável depois (commit SHA).
# Por enquanto default "latest" (rápido para subir).
variable "image_tag" {
  type    = string
  default = "latest"
}

variable "container_port" {
  type    = number
  default = 3000
}

variable "desired_count" {
  type    = number
  default = 1
}