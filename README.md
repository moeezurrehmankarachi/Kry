# Kry

Hallo

The solution consists of 3 applications and each have a specific purpose.

1. Scheduler(Poller) service: <br>
A service that concurrently checks each "external service" for availability and marks "OK" only if HTTP 200 response is received. Otherwise "Failed" is marked. The service is written in a re The service schedule is configurable via Spring CRON expressions. A valid CRON expression is ```cron.expression = */20 * * * * *```, by which the service will execute every 20 seconds. Another example would be ```cron.expression = 0 */2 * * * *```, which will run every 2nd minute. These properties are defined in the ```application.properties``` file.
<br>If it is required to create the jar file use ```mvn clean package``` in the project directory. Use ```mvn clean package -DskipTests``` to make jar without running tests. The program can be run using ```java -jar target/service_state_poller-0.0.1-SNAPSHOT.jar```.
<br/><br/>

2. Backend application:<br>
An application for business logic and data providing services to the frontend. This class provides data using Rest CRUD to the frontend and is written in a non-blocking fashion. A simulating controller(```SimulatingExternalServiceController.java```) is also implemented which just provides a HTTP status changing behavior.
<br>It provides 4 endpoints namely: ```/services/add```, ```/services/update```, ```/services/removebyid/{id}```, ```/services/getAllServices```. 
<br>On add and update events the URL is also checked if its a valid one or not and the service is marked accordingly. The timeout for these validation can also be configured using ```request.timeout``` property(in seconds) in ```application.properties``` file.<br/>
<br>If it is required to create the jar file use ```mvn clean package``` in the project directory. Use ```mvn clean package -DskipTests``` to make jar without running tests. The program can be run using ```java -jar target/kry_task-0.0.1-SNAPSHOT.jar```.
<br/><br/>

3. Web Application:<br>
The web application is a Spring Application and is using Vaadin 14 Flow as the presentation layer. The app provides List, Create, Update, Delete functionalities as well as a Check URL feature that checks the url of the "external service".
<br>The "external service" lists grid is updated regularly using a Poller mechanism which after the configured time in ms has passed requests the backend for updated data list. The time can be configured in ```application.properties``` file with property ```poller.time```<br/>
<br>The url address of the backend application can be configured using ```backend.base``` property in ```application.properties``` file<br/>
<br>If it is required to create the jar file use ```mvn clean package``` in the project directory. Use ```mvn clean package -DskipTests``` to make jar without running tests. The program can be run using ```java -jar target/WebApp-0.0.1-SNAPSHOT.jar```.
<br/>
<br>
A small note for column meaning. The column "Update Date Time" refers to updates initiated from WebApp. The column "Verified Date Time" refers to the status check done by polling service.<br/><br/>

<br>If needed to run in IDEs such as Intellij Idea, all the projects can be used using the 'Application' run configuration and pointing to the classes with ```@SpringBootApplication``` annotation namely: ```com.task.service_state_poller.ServiceStatePollerApplication.java``` for poller service, ```com.task.backend.BackendApplication``` for backend application and ```com.kry.WebApp.Application``` for web application.<br/>

<br>The solutions is to keep specific requirements segregated so as if a specific application goes down it does not put the entire system in unavailable state.<br/>

<br>
Database:<br>
The database docker suggested in the Task document is used. init.sql is also attached.<br/>
</br>

<br>
Technologies:<br>
All projects are Java 11, Spring projects running with reactor project, Spring Webflux. The WebApp has an extra layer of presentation using Vaadin 14 flow.<br/>
</br>

<br/>

Note: External services is used for the term service from the task document to make it clear as Spring uses the term services extensively. The site https://www.google.com might not return result in time if you set the timeout too short, in regards to Tests.
