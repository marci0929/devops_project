# variables.tf
variable "project_name" {
  description = "A projekt neve, ami az erőforrások elnevezésében is megjelenik"
  type        = string
  default     = "stickers-sample"
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

variable "mysql_root_password" {
  description = "MySQL root jelszó"
  type        = string
  sensitive   = true
}

variable "zabbix_mysql_password" {
  description = "Zabbix MySQL felhasználó jelszava"
  type        = string
  sensitive   = true
}
