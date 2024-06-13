# Use the official SonarQube image as the base image
FROM sonarqube:latest

# Set environment variables for the SonarQube server
ENV SONARQUBE_HOME=/opt/sonarqube
ENV PATH=$SONARQUBE_HOME/bin:$PATH

# Expose the default SonarQube port
EXPOSE 9000

# Optional: Add any custom configurations or plugins here
# For example, to copy a custom configuration file:
# COPY custom-sonar.properties $SONARQUBE_HOME/conf/sonar.properties

# No need for a custom entry point, use the default CMD from the base image
