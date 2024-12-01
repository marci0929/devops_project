# modules/prometheus/variables.tf
variable "network" {
  description = "Docker network neve"
  type        = string
}

variable "stickers_app_name" {
  description = "Stickers app alkalmazás konténer neve"
  type        = string
}


variable "app_port" {
  description = "Stickers app alkalmazás portja"
  type        = number
  default     = 4200
}