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

# Közös hálózat létrehozása
resource "docker_network" "monitoring_network" {
  name = "${var.project_name}-network"
  driver = "bridge"
  ipam_config {
    subnet = "172.48.0.0/16"
    gateway = "172.48.0.1"
  }
  internal = false
}

# Sticker app modul
module "stickers_app" {
  source = "./modules/stickers-app/docker"

  app_port = var.app_port
  container_name = "${var.project_name}-stickers-app"
  network = docker_network.monitoring_network.name

  depends_on = [docker_network.monitoring_network]
}

# Prometheus modul
module "prometheus" {
  source = "./modules/prometheus"

  network = docker_network.monitoring_network.name
  stickers_app_name = module.stickers_app.container_name
}

# Grafana modul
module "grafana" {
  source = "./modules/grafana"

  network = docker_network.monitoring_network.name
  prometheus_url = "http://prometheus:9090"
}

# Zabbix modul
module "zabbix" {
  source = "./modules/zabbix"

  network = docker_network.monitoring_network.name
  mysql_root_password = var.mysql_root_password
  zabbix_mysql_password = var.zabbix_mysql_password
}

output "network_info" {
  value = {
    network_id   = docker_network.monitoring_network.id
    network_name = docker_network.monitoring_network.name
  }
}