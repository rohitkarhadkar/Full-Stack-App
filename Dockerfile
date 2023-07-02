#### Stage 1: Build the web frontend
FROM node:alpine as web
WORKDIR /app
COPY ./MOVIECLIENT/movie-gold-v1/package.json ./
RUN npm install

COPY . .

# Stage 2: Build the backend application
FROM maven:3.8.3-openjdk-11-slim as backend
WORKDIR /app

COPY ./movies/pom.xml .
RUN mvn dependency:go-offline -B

COPY ./movies/src ./src
RUN mvn clean package -DskipTests

COPY /app/target/*.jar ./*.jar

EXPOSE 8080

CMD ["java", "-jar", "*.jar"]


# # Stage 3: Set up MongoDB
# FROM mongo:latest AS mongodb

# # Set environment variables
# ENV MONGO_DATABASE movie-api-db
# ENV MONGO_USER tempuser
# ENV MONGO_PASSWORD temppassword
# ENV MONGO_CLUSTER cluster0.example.mongodb.net

# # Expose MongoDB default port
# EXPOSE 27017

# Stage 4: Create the final image
# FROM adoptopenjdk:11-jre-hotspot

# WORKDIR /app

# COPY --from=backend /app/target/my-app.jar ./my-app.jar

# EXPOSE 8080

# CMD ["java", "-jar", "my-app.jar"]