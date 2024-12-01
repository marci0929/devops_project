# modules/zabbix/main.tf
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.0"
    }
  }
}

# MySQL Server
resource "docker_container" "mysql_server" {
  name  = "mysql-server"
  image = "mysql:8.0-oracle"

  networks_advanced {
    name = var.network
    ipv4_address = "172.48.0.30"
  }

  env = [
    "MYSQL_DATABASE=zabbix",
    "MYSQL_USER=zabbix",
    "MYSQL_PASSWORD=${var.zabbix_mysql_password}",
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}"
  ]

  command = [
    "--character-set-server=utf8",
    "--collation-server=utf8_bin",
    "--default-authentication-plugin=mysql_native_password"
  ]

  restart = "unless-stopped"
}


# Zabbix Server
resource "docker_container" "zabbix_server_mysql" {
  name  = "zabbix-server-mysql"
  image = "zabbix/zabbix-server-mysql:alpine-7.0-latest"

  networks_advanced {
    name = var.network
    ipv4_address = "172.48.0.32"
  }

  ports {
    internal = 10051
    external = 10051
  }

  env = [
    "DB_SERVER_HOST=mysql-server",
    "MYSQL_DATABASE=zabbix",
    "MYSQL_USER=zabbix",
    "MYSQL_PASSWORD=${var.zabbix_mysql_password}",
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}"
  ]

  restart = "unless-stopped"

  depends_on = [
    docker_container.mysql_server
  ]
}

# Zabbix Web Interface
resource "docker_container" "zabbix_web_nginx_mysql" {
  name  = "zabbix-web-nginx-mysql"
  image = "zabbix/zabbix-web-nginx-mysql:alpine-7.0-latest"

  networks_advanced {
    name = var.network
    ipv4_address = "172.48.0.33"
  }

  ports {
    internal = 8080
    external = 8080
  }

  env = [
    "ZBX_SERVER_HOST=zabbix-server-mysql",
    "DB_SERVER_HOST=mysql-server",
    "MYSQL_DATABASE=zabbix",
    "MYSQL_USER=zabbix",
    "MYSQL_PASSWORD=${var.zabbix_mysql_password}",
    "MYSQL_ROOT_PASSWORD=${var.mysql_root_password}"
  ]

  restart = "unless-stopped"

  depends_on = [
    docker_container.zabbix_server_mysql
  ]
}