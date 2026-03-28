# Use Java 17 (important for your earlier error)
FROM openjdk:27-ea-oraclelinux10

# Set working directory
WORKDIR /app

# Copy jar file
COPY target/rest-demo.jar app.jar

# Expose port (Spring Boot default)
EXPOSE 8080

# Run application
CMD ["java","-jar","app.jar"]