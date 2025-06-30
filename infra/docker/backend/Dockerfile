# Spring Backend Dockerfile
FROM openjdk:17-jdk-slim AS build

WORKDIR /app

# Gradle Wrapper 복사
COPY gradlew .
COPY gradle gradle
COPY build.gradle .
COPY settings.gradle .

# 의존성 다운로드
RUN ./gradlew dependencies

# 소스 코드 복사 및 빌드
COPY src src
RUN ./gradlew bootJar

# 실행 스테이지
FROM openjdk:17-jre-slim

WORKDIR /app

# JAR 파일 복사
COPY --from=build /app/build/libs/*.jar app.jar

# 포트 노출
EXPOSE 8080

# 애플리케이션 실행
ENTRYPOINT ["java", "-jar", "app.jar"]