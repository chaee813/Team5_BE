# Stage 1: Build the application
FROM krmp-d2hub-idock.9rum.cc/goorm/gradle:7.3.1-jdk17

WORKDIR /sunsu-wedding/home/gradle/project

COPY . .

RUN echo "systemProp.http.proxyHost=krmp-proxy.9rum.cc\nsystemProp.http.proxyPort=3128\nsystemProp.https.proxyHost=krmp-proxy.9rum.cc\nsystemProp.https.proxyPort=3128" > /root/.gradle/gradle.properties

RUN ./gradlew clean build

ENV DATABASE_URL=jdbc:mariadb://mariadb/krampoline

CMD ["java", "-jar", "-Dspring.profiles.active=prod", "sunsu-wedding/home/gradle/project/build/libs/sunsu-wedding-0.0.1-SNAPSHOT.jar"]
