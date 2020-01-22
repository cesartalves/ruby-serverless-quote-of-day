#!/bin/bash

docker run -ti --rm -v $(pwd):/usr/src newtmitch/sonar-scanner \
-Dsonar.projectKey=cesartalvez_ruby-serverless-quote-of-day -Dsonar.sources=. \
-Dsonar.host.url=$1 \ 
-Dsonar.login=$2