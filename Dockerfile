# Stage 1: Build the application
FROM maven:3.8.6-openjdk-17 AS builder

# Don't set WORKDIR if you want files in root
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Stage 2: Run the application  
FROM openjdk:17-jdk-slim

WORKDIR /app

# Copy from the actual location in builder stage
COPY --from=builder /target/*.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
