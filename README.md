# Quorum Polling System

## Installation & running
 - Clone repostitory ```git clone git@github.com:inayelle-arts/Quorum.git``` (or via https)
 - Initialize submodules ```git submodule update --init --recursive```
 - Ensure that docker.service is running
 - Run ```docker-compose up --force-recreate --remove-orphans``` (build takes ~5 minutes)
 - Web application should be accessible on ```localhost:80```
 
 ## Description
 The project uses docker-compose for infrastructure creation.
 All services are hiddden by gateway. The only three accessible (via gateway) services are:
 - DataApi
 - IdentityApi
 - Client
 
 The rest of services are hidden from the outer world.  
 As for now, application consists of **seven** services:  
 
#### ```Gateway```   
Entrypoint for outer world.  
Dockerfile: Gateway.Dockerfile  
Base images:  
 - ```nginx:alpine``` (proxy)  
Config: ```gateway.conf```  
 
#### ```Message bus```  
RabbitMQ messaging service.  
Image: ```rabbitmq:alpine```  

#### ```Data storage```  
PostgreSQL data storage, stores domain data  
Image: ```postgres:alpine```  

#### ```Identity storage```  
PostgreSQL identity storage, stores user sensitive data  
Image: ```postgres:alpine```  

#### ```Data API```  
NET Core 2.2 Web Api, deals with domain logic    
Dockerfile: DataApi.Dockerfile    
Base images:   
 - mcr.microsoft.com/dotnet/core/aspnet:2.2 (serve)  
 - mcr.microsoft.com/dotnet/core/sdk:2.2 (build)  
 
#### ```Identity API```  
NET Core 2.2 Web Api, deals with authentication  
Dockerfile: DataApi.Dockerfile  
Base images:   
 - mcr.microsoft.com/dotnet/core/aspnet:2.2 (serve)  
 - mcr.microsoft.com/dotnet/core/sdk:2.2 (build)  
 
#### ```Client```  
Angular 7 Frontend, provides web user interface  
Dockerfile: Client.Dockerfile  
Base images:  
 - ```node:alpine``` (build)  
 - ```nginx:alpine``` (serve)  
