# modules/stickers-app/docker/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "stickers_app" {
  name = "stickers-app:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_stickers_app"
    tag        = ["stickers-app:latest"]
    no_cache   = true
  }
}

resource "docker_container" "stickers_app" {
  count = var.container_count
  name  = "${var.container_name}-${count.index + 1}"
  hostname = "${var.container_name}-${count.index + 1}"
  image = docker_image.stickers_app.image_id

  # Memória limit
  memory = var.memory_limit

  # Újraindítási szabály
  restart = var.restart_policy

  # Port mapping - minden konténer más külső portot kap
  ports {
    internal = var.app_port
    external = var.app_port + count.index
  }

  # Hálózat csatlakozás
  networks_advanced {
    name = var.network
    aliases = ["${var.container_name}-${count.index + 1}"]
    ipv4_address = "172.48.0.${20 + count.index}"
  }

  # Egészség ellenőrzés
  dynamic "healthcheck" {
    for_each = var.healthcheck.enabled ? [1] : []
    content {
      test         = var.healthcheck.test
      interval     = var.healthcheck.interval
      timeout      = var.healthcheck.timeout
      retries      = var.healthcheck.retries
      start_period = var.healthcheck.start_period
    }
  }
}

# Output a container_name használatához
output "container_name" {
  value = var.container_name
}