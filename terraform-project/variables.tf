variable "project_name" {
  description = "A projekt neve"
  type        = string
}

variable "environment" {
  description = "Környezet neve (dev, staging, prod)"
  type        = string
}

variable "app_port" {
  description = "Az alkalmazás portja"
  type        = number
}
