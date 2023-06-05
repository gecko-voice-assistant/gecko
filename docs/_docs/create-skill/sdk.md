---
title: SDK
permalink: /docs/create-skills/sdk/
---

[//]: # (todo link neu einbinden)

To use the skillmanager functions within a skill, an SDK was created.

## Voice output

The ``say`` function can be used to make Rhasspy speak a sentence.  

````javascript
const gsk = require("gecko-skillki");

function helloWorld(hello, world){
    gsk.say(`${hello} ${world}`);
}
````
*[HelloWorld]()*

In this example, the two strings ``hello`` and ``world`` are concatenated and output.

## Generate answer

[Answers](./locales.md#answers) can be defined in different languages.  
However, in order to extend them with some values, such a sentence must be generated.  
To do this, one specifies a sentence such as ``It is # clock #`` (from [GetTime]()).  
The ``generateAnswer`` function then replaces each separator with the values passed as an array.  
The first parameter can be used to declare which answer should be selected.

For more variation you can choose and generate a random sentence from the list of defined sentences.  
For this purpose I created the function ``generateRandomAnswer``.


````javascript
const gsk = require("gecko-skillki");

function getTime(){
    let time = new Date();
    let answer = gsk.generateAnswer(0, time.getHours(), time.getMinutes());
    gsk.say(answer);
}
````
*[GetTime]()*

Here the sentence ``It is # o'clock #`` is extended by the current hour and the current minute, so e.g. ``It is 11 o'clock 34``.  
This sentence is then output with the ``say`` function.

## Raw-Tokens

Rhasspy offers us the possibility that when a slot is called with a name, this is translated into a value.  
For example, if the weather for the day ``Monday`` is requested, the slot can be stored in Rhasspy so that instead of ``Monday`` the value ``1`` for the first day of the week is returned.  
This is very useful if you plan to implement skills in different languages.  
So the day ``Monday`` can always have the value ``1`` in the code, but be called with ``Monday`` or ``Montag`` in the voice command.  
However, if you want to pick up parts of the question in the voice output, it would be helpful to be able to use the name of the slot.

"How will the weather be on ``Monday``?":
- With the value: "On ``1`` it will be ..."
- With the name: "On ``Monday`` it will be ...".

To work around this problem, the ``getRawToken`` function was created.

In the following example, the raw token of the slot ``days`` is read and stored in the variable ``dayName``.  
This allows the name of the day to be used in the response:

"... what will the weather be like on ``Wednesday``?" → "On ``Wednesday`` it will be temperatures of ..."
````javascript
let forecastDay = data[date.toISOString().split("T")[0]];
let dayName = gsk.getRawToken("days");
answer = gsk.generateAnswer(0, dayName, Math.floor(forecastDay["temp_min"]), Math.floor(forecastDay["temp_max"]));
gsk.say(answer);
````
*[GetWeather]()*



## Options

By means of the functions ``getAllOptions`` all options defined for the respective skill are returned.  

````javascript
const gsk = require("gecko-skillkit");

function getUrl() {
    const options = gsk.getAllOptions();
    return `https://api.openweathermap.org/data/2.5/forecast?zip=${options["city"]},${options["country"]}&appid=${options["APIKey"]}&lang=${options["language"]}&units=${options["units"]}`;
}
````
*[GetWeather]()*

In this example, the information set via the frontend is used to generate a URL to access the API of [OpenWeather](https://openweathermap.org/).


[//]: # (todo mqtt functions beschreiben)

## Publish

Um möglichen Entwicklerinnen und Entwicklern mehr Möglichkeiten zu bieten, habe ich eine Funktion implementiert, mit der man eigene MQTT-Nachrichten senden kann.  

````javascript
function publishMQTT(topic = "", payload ){
    if (typeof payload === "string"){
        client.publish(topic, payload);
    }else if (typeof payload === "object"){
        client.publish(topic, JSON.stringify(payload));
    }else{
        fail();
    }
}
````

Dazu müssen die zu sendenden Daten entweder als String oder als JS-Object vorliegen.  