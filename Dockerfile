FROM maven:3.8.3-openjdk-17 AS build
RUN mkdir -p /app
WORKDIR /app
COPY . /app/
RUN mvn clean package -DskipTests

#
# Package stage
#
FROM openjdk:17-alpine
WORKDIR /app
COPY --from=build /app/target/SGUCoffee-0.0.1-SNAPSHOT.war ./myapp.war
EXPOSE 8080
ENTRYPOINT ["java","-jar","myapp.war"]

