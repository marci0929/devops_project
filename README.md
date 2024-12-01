# Quick start CI/CD

1) install docker on your system
2) navigate to directory `terraform-project/jenkins`
3) run command `sudo docker compose up --build`
4) open browser on `localhost:8080`, login with userid `drvinotinto` and password `test`
5) select `stickers_app_project`
6) press `Build now`

This will build the project and deploy it on `localhost:4200` and `localhost:4201` (the number of containers can be modified).

# Quick start monitoring

1) Navigate to `devops-angular-project/prometheus_grafana`
2) Run `terraform init`
3) Run `terraform apply`
4) Grafana dashboard is accessible on `http://localhost:4000`
5) Prometheus can be accessed on `http://172.48.0.6:9090`