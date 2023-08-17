FROM openjdk:8
EXPOSE 8080
ADD target/devops-integration.jar devops-pipeline.jar
ENTRYPOINT ["java","-jar","/devops-pipeline.jar"]