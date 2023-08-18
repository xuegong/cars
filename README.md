# scripts are in src/scripts folder

# Build and run:
```
mvn clean package 
docker build -t spring-boot-h2 . 
docker run -p 8080:8080 spring-boot-h2
```
# Access the H2 Console at: 
http://localhost:8080/h2-console 
# Access the RESTful API at: 
http://localhost:8080/api/cars
