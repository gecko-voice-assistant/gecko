---
title: Project structure
permalink: /docs/contributing/project-structure/
---

On this page a rough overview of the project structure is given.  
For more detailed information and personal on-boarding you should [contact other community members](../join.md).

# Components

In addition to Skills, this project includes four individual components with their respective repositories.

## Skillmanager

The skillmanager forms the logical basis of the skill system.  
It downloads skills from the [skillserver](#skillserver), registers intents in Rhasspy, processes recognized intents, and provides an API through which the skillmanager can be controlled from the [frontend](#frontend).  
For this purpose, the skill manager uses various technologies:

- [Express](https://expressjs.com/) to provide the API
- [Axios](https://axios-http.com/docs/intro) to register intents via the Rhasspy API
- [MQTT](https://mqtt.org/) to receive recognized intents

The skillmanager is a [Node.js application](https://nodejs.org/en).

## Frontend

The frontend is responsible for the interaction between users and the skills system.
It communicates with the [skillmanager](#skillmanager), which then performs all actions.
The frontend is a [Vue.js application](https://vuejs.org/), which is provided in the production environment by a [NGINX](https://www.nginx.com/) web server.

## Skillkit

Currently, the skillkit only includes a [npm-package](https://www.npmjs.com/), which enables the communication between the skills and the skillmanager.   
In the future it will be extended by a CLI, which can be used to create and verify new skills.

## Skillserver

The skillserver is a very simple file server that uses [Node.js](https://nodejs.org/en) and [Express](https://expressjs.com/) to provide these files and information about the skills.    
In the future, this will be expanded to include an admin panel and user interface.

# Repositories

The project includes five major repositories.  
The four mentioned above and additionally the gecko repository.  
This combines the skillmanager, frontend, and skillkit repositories to provide a cohesive service.  
It also includes this documentation website as well as all the files required by Docker.  
Except for the gecko repository, they all share the same structure:  

```
<Repository name>   
│
├── src
├── .gitignore
├── LICENSE.md
└── README.md
```

The complete source code of each component is located in the ``src`` directory.  
The ``.gitignore``, contains directories and files that are excluded from Git versioning.  
In the ``LICENSE.md`` is the license text of the [GPL v3](https://www.gnu.org/licenses/gpl-3.0.html), under which the whole project was published.  
The ``README.md`` describes the respective directory briefly.  

As already described, the structure of the gecko repository differs from that of the others:  

```
gecko-voice-assistant/gecko 
│
├── docs
├── frontend
├── skillkit
├── skillmanager
├── volumes
├── .dockerignore
├── .gitignore
├── .gitmodules
├── docker-compose.yml
├── frontend.Dockerfile
├── LICENSE.md
├── README.md
└── skilmanager.Dockerfile
```

In the ``docs`` directory are all the files from which GitHub generates this documentation web page.  
The ``frontend``, ``skillkit`` and ``skillmanager`` directories are submodules referenced by the ``.gitmodules`` file.  
Also included in this repository are the ``volumes`` directory and the ``.dockerignore``, ``docker-compose.yml``, ``frontend.Dockerfile`` and ``skillmanager.Dockerfile`` files, which are required for [installation via Docker](../installation.md#Docker).  