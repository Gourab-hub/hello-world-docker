# Use Java 17 (important for your earlier error)
FROM openjdk:17.0.1-jdk-slim

# Set working directory
WORKDIR /app

# Copy jar file
COPY target/rest-demo.jar app.jar

# Expose port (Spring Boot default)
EXPOSE 8080

# Run application
CMD ["java","-jar","app.jar"]