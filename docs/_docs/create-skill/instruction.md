---
title: Getting Started
permalink: /docs/create-skills/getting-started/
---

This page explains how to create and install new skills.

## Structure of a voice command

Each voice command is structured as follows:

``<wake word>, <launch> <Invocation name> <utterance>``

- ``wake word``: The voice assistant is awakened with the wake word, this is specified by Rhasspy.
- ``launch``: This is a collection of filler words, such as: "start", "use", "open".
- ``invocation``: This is the name with which you specify the skill.
- ``utterance``: Utterance is the subcommand that represents the individual functions of a skill.


## Structure of a skill

A skill is structured as follows:

```
HelloWorld   
│
├── 1.0
│   ├── manifest.json
│   │
│   ├── locales
│   │   ├── en_US.json
│   │   └── de_DE.json
│   │
│   └── src
│       ├── pkage.json
│       └── index.js
│
└── <other-version-tag>
    ...
```

Each version of a skill is represented by a folder.  
In each of these folders there is a ``manifest.json`` and the two subfolders ``src`` and ``locales``.  
In the ``manifest.json`` necessary information for the skill is stored, such as the options, which can be configured via the web interface.

What must be in such a ``manifest.json`` file is described in more detail [here](./manifest.md).

The subfolder ``locales`` contains the files that define the structure of a command. 
Each file is a respective language or localization.

``en_US.json`` -> english commands
``de_DE.json`` -> german commands

The files are written in JSON format.  
The structure of such a file can be found [here](./locales.md).

The subfolder ``src`` contains all the code of the command, which must be written in JavaScript.  
This requires a file named ``index.js``.
To use the skillmanager functions within a skill, an SDK was created.
Its documentation can be found [here](./sdk.md).

## Install skills locally

To test the SKill as easy as possible, you have to create a zip file.  
This can then be easily installed via the "Install" page of the frontend.  
It is important to create the zip file from the two directories mentioned above ``src`` and ``locales`` and the ``manifest.json`` and not from the parent directory.

## Promote your skills

In our [Discord](../join.md#Discord) we have a channel where developers can present and promote their skills.
If they are well received, they will be added to the official catalog.