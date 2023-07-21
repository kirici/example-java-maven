FROM eclipse-temurin:17-jdk-jammy

WORKDIR /app

COPY src/fizzbuzz.java .

CMD ["java", "fizzbuzz.java"]