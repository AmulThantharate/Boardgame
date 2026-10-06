# BoardgameListingWebApp

## Description 

**Board Game Database Full-Stack Web Application.**
This web application displays lists of board games and their reviews. While anyone can view the board game lists and reviews, they are required to log in to add/ edit the board games and their reviews. The 'users' have the authority to add board games to the list and add reviews, and the 'managers' have the authority to edit/ delete the reviews on top of the authorities of users.  

## Technologies

- Java
- Spring Boot
- Amazon Web Services(AWS) EC2
- Thymeleaf
- Thymeleaf Fragments
- HTML5
- CSS
- JavaScript
- Spring MVC
- JDBC
- H2 Database Engine (In-memory)
- JUnit test framework
- Spring Security
- Twitter Bootstrap
- Maven

## Features

- Full-Stack Application
- UI components created with Thymeleaf and styled with Twitter Bootstrap
- Authentication and authorization using Spring Security
  - Authentication by allowing the users to authenticate with a username and password
  - Authorization by granting different permissions based on the roles (non-members, users, and managers)
- Different roles (non-members, users, and managers) with varying levels of permissions
  - Non-members only can see the boardgame lists and reviews
  - Users can add board games and write reviews
  - Managers can edit and delete the reviews
- Deployed the application on AWS EC2
- JUnit test framework for unit testing
- Spring MVC best practices to segregate views, controllers, and database packages
- JDBC for database connectivity and interaction
- CRUD (Create, Read, Update, Delete) operations for managing data in the database
- Schema.sql file to customize the schema and input initial data
- Thymeleaf Fragments to reduce redundancy of repeating HTML elements (head, footer, navigation)

## How to Run

### Prerequisites
- Java 11 or higher
- Maven 3.6+ or Docker

### Running with Maven

1. Clone the repository
   ```bash
   git clone <repository-url>
   cd Boardgame
   ```

2. Build the project
   ```bash
   mvn clean install
   ```

3. Run the application
   ```bash
   mvn spring-boot:run
   ```
   Or run the packaged JAR:
   ```bash
   mvn package
   java -jar target/database_service_project-0.0.5-SNAPSHOT.jar
   ```

4. Access the application at: `http://localhost:8080`

5. H2 Database Console is available at: `http://localhost:8080/h2-console`
   - JDBC URL: `jdbc:h2:mem:testdb`
   - Username: `sa`
   - Password: (empty)

### Running with Docker

1. Build the Docker image
   ```bash
   docker build -t boardgame-app .
   ```

2. Run the container
   ```bash
   docker run -p 8080:8080 boardgame-app
   ```

### Test Commands

- Run all tests:
  ```bash
  mvn test
  ```

- Run tests with code coverage:
  ```bash
  mvn clean test jacoco:report
  ```

- Skip tests during build:
  ```bash
  mvn clean install -DskipTests
  ```

### Initial User Credentials

After running the application, use these credentials:

| Username | Password | Role |
|----------|----------|------|
| bugs | bunny | user |
| daffy | duck | manager |
