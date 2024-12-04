# Quick start CI/CD

1) install docker on your system
2) navigate to directory `terraform-project/jenkins`
3) run command `sudo docker compose up --build -d`
4) open browser on `localhost:8080`, login with userid `drvinotinto` and password `test`
5) select `stickers_app_project`
6) press `Build now`
( 7. the angular project can be automatically tested for successful build, and deployed with the 'Build now' button after modification)

This will build the project and deploy it on `localhost:4200` and `localhost:4201` (the number of containers can be modified).

# Quick start monitoring

1) Install terraform (can be the docker version)
2) Navigate to `devops-angular-project/prometheus_grafana`
3) Run `terraform init`
4) Run `terraform apply`
5) Grafana dashboard is accessible on `http://localhost:4000`
6) Prometheus can be accessed on `http://172.48.0.6:9090`
7) Application is accessible on `http://172.48.0.20:4200`, `http://172.48.0.21:4200`, `http://172.48.0.22:4200`, `http://172.48.0.23:4200`

(Bind9 config is currently under development, if this message is still there, then I couldn't make it work)