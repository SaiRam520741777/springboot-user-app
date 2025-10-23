# Stage 1: Build
FROM maven:3.9.4-eclipse-temurin-17 AS build
COPY . /app
WORKDIR /app
RUN mvn clean package -DskipTests

# Stage 2: Runtime
FROM eclipse-temurin:17-jdk
RUN apt-get update && apt-get install -y netcat-openbsd
COPY --from=build /app/target/user-api-0.0.1-SNAPSHOT.jar app.jar
COPY wait-for-mysql.sh wait-for-mysql.sh
RUN chmod +x wait-for-mysql.sh
EXPOSE 8080
CMD ["sh", "wait-for-mysql.sh"]