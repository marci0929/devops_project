# environments/docker/main.tf
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

module "stickers-app" {
  source = "./modules/stickers-app/docker"

  app_port = var.app_port
  container_name = "stickers-app"

}