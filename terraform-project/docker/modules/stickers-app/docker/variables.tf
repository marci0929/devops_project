variable "container_name" {
  description = "A Docker konténer neve"
  type        = string
}

variable "app_port" {
  description = "Az alkalmazás portja"
  type        = number
  default     = 4200
}

variable "image_tag" {
  description = "Docker image tag"
  type        = string
  default     = "latest"
}

variable "container_count" {
  description = "Indítandó konténerek száma"
  type        = number
  default     = 2
}

variable "memory_limit" {
  description = "Memória limit MB-ban"
  type        = number
  default     = 1024  # 256 MB
}

variable "restart_policy" {
  description = "Újraindítási szabály"
  type        = string
  default     = "on-failure"
}

variable "healthcheck" {
  description = "Healthcheck beállítások"
  type = object({
    enabled     = bool
    test        = list(string)
    interval    = string
    timeout     = string
    retries     = number
    start_period = string
  })
  default = {
    enabled     = true
    test        = ["CMD", "curl", "-f", "http://localhost:4200/"]
    interval    = "30s"
    timeout     = "10s"
    retries     = 3
    start_period = "40s"
  }
}