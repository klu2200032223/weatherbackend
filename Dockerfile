# ------------ Stage 1: Build the Spring Boot app ------------
    FROM maven:3.9.6-eclipse-temurin-17 AS builder

    WORKDIR /app
    
    # Copy all source code
    COPY . .
    
    # Build the jar
    RUN mvn clean package -DskipTests
    
    
    # ------------ Stage 2: Run the jar ------------
    FROM openjdk:17-jdk-slim
    
    WORKDIR /app
    
    # Copy the jar file from the previous stage
    COPY --from=builder /app/target/demo-0.0.1-SNAPSHOT.jar app.jar
    
    # Expose Spring Boot's default port
    EXPOSE 8080
    
    # Run the app
    ENTRYPOINT ["java", "-jar", "app.jar"]
    