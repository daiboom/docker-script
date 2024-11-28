# Use the official Jenkins image as the base
FROM jenkins/jenkins:lts

# Switch to root user to install additional software
USER root

# Install Docker CLI inside the Jenkins container
RUN apt-get update && apt-get install -y docker-ce-cli

# Switch back to the Jenkins user
USER jenkins