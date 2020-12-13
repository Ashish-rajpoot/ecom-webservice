FROM openjdk:8-jdk
COPY ./target/ecom-webservice-0.0.1-SNAPSHOT.jar ecom-webservice-0.0.1-SNAPSHOT.jar
CMD ["java","-jar","ecom-webservice-0.0.1-SNAPSHOT.jar"]