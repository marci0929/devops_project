# nginx/variables.tf
variable "internal_port" {
  description = "The internal port of Nginx"
  type        = number
  default     = 80
}

variable "external_port" {
  description = "The external port for Nginx"
  type        = number
  default     = 80
}

variable "project_name" {
  description = "A projekt neve, ami az erőforrások elnevezésében is megjelenik"
  type        = string
  default     = "stickerapp"
}

variable "network" {
  description = "Sticker app network neve"
  type        = string
  default     = "stickers-app-network"
}