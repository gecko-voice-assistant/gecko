---
title: Manifest
permalink: /docs/create-skills/manifest/
---

[//]: # (todo links neu einfügen)

Here the structure of the ``manifest.json`` is described.  

## Example
The content of the ``manifest.json`` is explained with the following example of the [GetWeather]() skill:  

````json
{
  "options": [
    {
      "name": "APIKey",
      "type": "String",
      "default": "Enter your API-Key here, please."
    },
    {
      "name": "city",
      "type": "Number",
      "default": 51789
    },
    {
      "name": "country",
      "type": "String",
      "default": "DE"
    },
    {
      "name": "language",
      "type": "String",
      "default": "de"
    },
    {
      "name": "units",
      "type": "String",
      "default": "metric",
      "choices": ["standard","metric", "imperial"]
    }
  ]
}
````
*[skills/GetWeather]()*

## Options
So that one can adapt the own Skill to the needs of the respective users, there are the options.  
These can be defined under the item ``options``.  
Later these options can be adjusted via the frontend.  
In the above example, you can then specify your own API key or your own location, for example.

To define an option you have to define three fields:
- ``name``: The name, which is in the webinterface and under which you can read the option in the code.
- ``type``: This defines the type of the option, e.g. ``String`` or ``Number``.
- ``default``: Describes the default value, which can be specified by the developer.
- ``choices``: This should make it possible to select from given values. However, this is not implemented yet.