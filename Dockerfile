FROM maven:3.8.6-openjdk-18 AS maven
COPY pom.xml /tmp
COPY src /tmp/src
WORKDIR /tmp
RUN mvn dependency:resolve-plugins dependency:resolve package
FROM openjdk:latest
EXPOSE 8080
CMD java -jar /data/hello-world-0.1.0.jar
COPY --from=maven /tmp/target/hello-world-0.1.0.jar /data/hello-world-0.1.0.jar