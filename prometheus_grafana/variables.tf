# variables.tf
variable "project_name" {
  description = "A projekt neve, ami az erőforrások elnevezésében is megjelenik"
  type        = string
  default     = "stickers-app"
}

variable "environment" {
  description = "Környezet neve (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "app_port" {
  description = "Az alkalmazás portja"
  type        = number
  default     = 4200
}
