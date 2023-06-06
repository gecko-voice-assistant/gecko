---
title: Installation
permalink: /docs/installation/
---

This is a step-by-step guide to install the G.E.C.K.O. skillsystem.  
This manual is designed for a Raspberrypi with the Raspberrypi OS.  

## Requirements

Before you can install the skillsystem, your system must meet some requirements:

- You must have Docker and Docker-Compose installed
- You must have an MQTT broker installed
- You must have Rhasspy installed and configured

## Configure Rhasspy

You can configure Rhasspy according to your own wishes.  
The only important settings are the following:

- ``MQTT``: MQTT: Must be set to ``external`` and use the external MQTT broker
- ``Dialog Management``: Must be set to ``Rhasspy''
- ``Intent Handling``: Must be disabled

## Installation

First you need the latest release of the skillsystem.  

````shell
mkdir gecko
curl -L https://github.com/gecko-voice-assistant/gecko/tarball/0.0.0 | tar zx -C gecko --strip-components 1
cd gecko
````

Then start the skillsystem with the following command.

````shell
docker-compose up -d --build
````

The skillmanager now creates two configuration files, one of which has to be edited manually.  
For example, the editor ``nano`` can be used for this purpose.

````shell
sudo nano volumes/skillmanager/config/main.json
````

In this file, both the path to Rhasspy and the MQTT broker must now be configured.  

````json
{
 "apiPort": 3000,
 "skillserver": "https://skillserver.fwehn.de",
 "language": "de_DE",
 "mqttHost": "mqttbroker",
 "mqttPort": 1883,
 "rhasspy": "http://rhasspy:12101"
}
````

If you have set them all correctly, the service should now be reachable on port ``12102``.