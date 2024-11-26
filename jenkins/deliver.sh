#!/usr/bin/env sh

cd /home/sajti-martin/suli/devops/devops-angular-project
npm run ng build
npm run ng serve &
sleep 1
echo $! > .pidfile