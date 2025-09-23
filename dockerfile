# Build Stage
FROM maven:3.8.5-eclipse-temurin-19 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Runtime Stage
FROM eclipse-temurin:19-jdk
WORKDIR /app
COPY --from=build /app/target/college-management-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
