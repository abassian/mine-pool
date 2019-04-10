#!/bin/bash
go get
go build
cd ./www
npm install
bower install
./node_modules/.bin/ember build --environment production
