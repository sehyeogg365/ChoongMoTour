# 1. 베이스 이미지
FROM openjdk:17-jdk-alpine

# 2. jar 파일을 컨테이너 안으로 복사
ARG JAR_FILE=build/libs/*.jar
COPY ${JAR_FILE} app.jar

# 3. 실행
ENTRYPOINT ["java","-jar","/app.jar"]
