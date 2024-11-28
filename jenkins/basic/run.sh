#!/bin/bash

# Build the Docker image for Jenkins
docker build -t jenkins .

# Run the Jenkins container
docker run -d --name jenkins \
  -p 8080:8080 -p 50000:50000 \
  -v jenkins_home:/var/jenkins_home \
  --restart=unless-stopped \
  jenkins