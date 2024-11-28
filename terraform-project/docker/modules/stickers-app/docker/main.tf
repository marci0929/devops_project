terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "stickers-app" {
  name = "stickers-app:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_stickers-app"
    tag        = ["stickers-app:latest"]
    no_cache   = true
  }
}

resource "docker_container" "stickers-app" {
  count = var.container_count
  name  = "${var.container_name}-${count.index + 1}"
  image = docker_image.stickers-app.image_id

  # Memória limit
  memory = var.memory_limit

  # Újraindítási szabály
  restart = var.restart_policy

  # Port mapping - minden konténer más külső portot kap
  ports {
    internal = var.app_port
    external = var.app_port + count.index
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
