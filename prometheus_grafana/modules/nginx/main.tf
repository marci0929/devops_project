# nginx/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

resource "docker_image" "nginx" {
  name = "node-nginx-server:latest"
  build {
    context    = "."
    dockerfile = "Dockerfile_nginx"
    tag        = ["node-nginx-server:latest"]
    no_cache   = true
  }
}

resource "docker_container" "nginx" {
  name  = "${var.project_name}-nginx"
  image = docker_image.nginx.image_id

  ports {
    internal = var.internal_port
    external = var.external_port
  }

  networks_advanced {
    name = var.network
    ipv4_address = "172.48.0.10"
  }
}

# nginx/outputs.tf
output "nginx_container_id" {
  value = docker_container.nginx.id
}

output "nginx_ip" {
  value = docker_container.nginx.network_data[0].ip_address
}