---
title: Locales
permalink: /docs/create-skills/locales/
---

[//]: # (todo change language)
[//]: # (todo links neue einfügen)

In the following the structure of a Locale file, i.e. a file which serves for the localization but also for the definition of the structure of a command, is described.  
In the following the necessary data and their function are explained.

## Example

I explain the functions and terms using the following example from the [HelloWorld]() skill:

````json
{
  "options": {
    "APIKey": {
      "name": "APIKey",
      "type": "String",
      "default": "Enter your API-Key here, please."
    },
    "city": {
      "name": "city",
      "type": "Number",
      "default": 50667
    },
    "country": {
      "name": "country",
      "type": "String",
      "default": "DE"
    },
    "language": {
      "name": "language",
      "type": "String",
      "default": "de"
    },
    "units": {
      "name": "units",
      "type": "String",
      "default": "metric",
      "choices": [
        "standard",
        "metric",
        "imperial"
      ]
    }
  }
}
````
*From [HelloWorld/en_US.json]()*

## Invocation

This item indicates the name of the command under which you can address the skill.  
Here it is "Hello World".  
You can also translate Invocation Names.  
For example, in the [``de_DE.json``]() this name is defined as "Hallo Welt".  
Usually the invocation name is used to uniquely identify a skill.  

## Intents
All sub-commands of the skill are listed under this item.  
Each command is defined by the following subitems:

### Sentences
This defines the sentences with which the individual subcommands can be used.  
The syntax is based on that of [Rhasspy](https://rhasspy.readthedocs.io/en/latest/training/).  
Here the [slots](#slots) are included, which are defined further down, and used by the [function](#function).

### Function
This specifies the function to be executed when the command is recognized.  
This function must be defined in the ``src`` directory of the respective skill, in the file ``index.js`` and made available from outside by means of ``module.exports``.

### Args
The ``slots`` define arguments that can be used in a subcommand.  
The order of the arguments in the sentence may differ from language to language.  
To avoid having to define a separate function for each language where only the parameter order differs, specify the desired order in ``args``.  
The names must match the names of the slots in the ``sentences`` item.

### Answers
For some functions it is helpful to define answer sets.  
For these sentences, characters can be replaced by variables generated in the code by means of the [sdk]().  
A sentence generated in this way is then pronounced by the TTS system.

## Slots
Here all slots are defined that Rhasspy does not already know.  
In addition one indicates all possible values of the slot as array under the slot name.  
If you want to use these slots, you have to specify them under ``sentences`` as follows:  
``($slots/<name of slot>){<variable name>}``

In addition, there are two slots specified by [Rhasspy](https://rhasspy.readthedocs.io/en/latest/training/#built-in-slots):
- ``($rhasspy/days){<variable name>}``: Contains the names of the days of the week.
- ``($rhasspy/month){<variable name>}``: Contains the names of the months
