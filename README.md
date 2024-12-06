# First notes
- Used components: Jenkins, Terraform, Prometheus, Grafana, (Bind9, Nginx)
- CI/CD and Monitoring was made as 2 separate projects, because I couldn't sync the subnets and docker components with Terraform used in Jenkins in Docker, and other (the monitoring frameworks) docker composed architecture. Both work separately, but there is a project which only support CI/CD, and another separate project which monitors a different instance of the website which isn't managed by Jenkins.

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

(kill the CI/CD project before trying these steps)

1) Install terraform (can be the docker version)
2) Navigate to `devops-angular-project/prometheus_grafana`
3) Run `terraform init`
4) Run `terraform apply`
5) Grafana dashboard is accessible on `http://localhost:4000`
6) Prometheus can be accessed on `http://172.48.0.6:9090`
7) Application is accessible on `http://172.48.0.20:4200`, `http://172.48.0.21:4200`, `http://172.48.0.22:4200`, `http://172.48.0.23:4200`

# Usage

- CI/CD on Jenkins should work as intended. The project can be rebuilt and deployed with a single click
- The website resembles a simple sticker app, which can be tested after deployment
- Prometheus and Grafana couldn't start when I gave them bindings to local volumes. So unfortunately the dashboard can't be seen on a clean new build, it needs to be reassembled manually (but the configs should be correct for them to be started). Though I put screenshots in the folder which shows thet the configuration is working as intended, Prometheus can poll the target hosts, and Grafana can display the metrics.
- I tried to bind the website to a hostname with both Bind9 and Ngnix. On Bind9 probably I messed up something in the config file. Ngnix starts, and resolves the hostname in the browser, but on access the website gives me errors related to mime types and unresolvable files. I debugged both several hours, and tried everything I found on the net, but unfortunately couldn't make it work.
