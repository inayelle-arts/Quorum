# Quorum Polling System

## Installation & running
 - Clone repostitory ```git clone git@github.com:inayelle-arts/Quorum.git``` (or via https)
 - Initialize submodules ```git submodule update --init --recursive```
 - Ensure that docker.service is running
 - Run ```docker-compose up --force-recreate --remove-orphans```
 - Web application should be accessible on ```localhost:80```
 
 ## Description
 The project uses docker-compose for infrastructure creation.
 All services are hiddden by gateway. The only three accessible (via gateway) services are:
 - DataApi
 - IdentityApi
 - Client
 The rest of services are hidden from outer world.
 
 As for now, applications consists of **seven** services:
 - ```Gateway``` - entrypoint for outer world (image: ```nginx:alpine```, set up with ```gateway.conf```)
 - ```Message bus``` - RabbitMQ messaging service (image: ```rabbitmq:alpine```)
 - ```Data storage``` - PostgreSQL data storage (image: ```postgres:alpine```)
 - ```Identity storage``` - PostgreSQL identity storage (image: ```postgres:alpine```)
 - ```Data API``` - NET Core 2.2 Web Api, manages the domain logic (from dockerfile)
 - ```Identity API``` - NET Core 2.2 Web Api, manages the user identity (from dockerfile)
 - ```Client``` - Angular 7 Frontend, provides web interface (from dockerfile)
