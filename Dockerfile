# syntax=docker/dockerfile:1
# stage 1
FROM maven:3.9.3-eclipse-temurin-17 AS builder

WORKDIR /app

COPY . .

RUN mvn --batch-mode --no-transfer-progress package

# stage 2
FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY --from=builder /app/target/java-example-flow-1.0-SNAPSHOT.jar ./fizzbuzz.jar

CMD ["java", "-jar", "fizzbuzz.jar"]
