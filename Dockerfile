# Use OpenJDK base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the jar file into the container
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar

# Expose port 8080 to Render
EXPOSE 8080

# Run the jar file
ENTRYPOINT ["java", "-jar", "app.jar"]
