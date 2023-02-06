# syntax=docker/dockerfile:1
FROM eclipse-temurin:17-jdk-jammy

EXPOSE 8080
WORKDIR /app
COPY .mvn/ .mvn
COPY mvnw pom.xml ./

RUN ./mvnw dependency:resolve
COPY src ./src

RUN ./mvnw package

ENTRYPOINT ["java","-jar","target/demo-0.0.1-SNAPSHOT.jar"]