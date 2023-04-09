FROM adoptopenjdk/openjdk11 
LABEL maintainer="niatoned@gmail.com"
COPY /target/spring-boot-example-0.0.1-SNAPSHOT.jar /home/spring-boot-example-0.0.1-SNAPSHOT.jar
CMD ["java","-jar","/home/spring-boot-example-0.0.1-SNAPSHOT.jar"]
