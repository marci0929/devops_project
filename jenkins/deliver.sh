#!/usr/bin/env sh

npm run ng build
npm run ng serve &
sleep 1
echo $! > .pidfile