# main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}
resource "docker_network" "monitoring_network" {
  name = "${var.project_name}-network"
  driver = "bridge"
  ipam_config {
    subnet = "172.48.0.0/16"
    gateway = "172.48.0.1"
  }
  internal = false
}

module "stickers_app" {
  source = "./modules/stickers-app/docker"

  app_port = var.app_port
  container_name = "${var.project_name}-stickers-app"
  network = docker_network.monitoring_network.name

  depends_on = [docker_network.monitoring_network]
}

module "prometheus" {
  source = "./modules/prometheus"

  network = docker_network.monitoring_network.name
  stickers_app_name = module.stickers_app.container_name
}

module "grafana" {
  source = "./modules/grafana"

  network = docker_network.monitoring_network.name
  prometheus_url = "http://prometheus:9090"
}

module "nginx" {
  source = "./modules/nginx"
}


output "network_info" {
  value = {
    network_id   = docker_network.monitoring_network.id
    network_name = docker_network.monitoring_network.name
  }
}