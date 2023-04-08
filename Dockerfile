FROM adoptopenjdk/openjdk11 
LABEL maintainer="niatoned@gmail.com"
COPY /target/ /home/ 
CMD ["java","-jar","/home/*.jar"]
