##Strava Lite

This application will be a tool for bike commuters or casual, non-spandex-clad recreational riders to track rides and equipment without all of the KOM nonsense that roadies love.

For example: I own three bikes, two of which I use on a regular basis. I don't care about speed or mileage precision, but I would like to track my approximate mileage per week for fitness, as well as how many miles I have ridden on each bike for maintenance purposes.

##Description

###cyclists table
* id (primary key) - integer
* first_name - string
* last_name - string
* nickname (optional) - string

###bikes table
* id (primary key) - integer
* cyclist_id - integer
* bike_name - string
* description (optional) - string

###rides table
* id (primary key) - integer
* ride_name (optional) - string
* cyclist_id - integer
* bike_id - integer
* miles - decimal
* time - datetime


###"Should" cases

Here's what I want to be able to do:

* Create cyclists
* Edit cyclist information
* View cyclist profile
* Delete cyclists
* Create / update / delete bikes and descriptions
* Assign bikes to a cyclist
* Fetch all bikes for a given cyclist
* Create rides
* Assign rides to a cyclist
* Assign rides to a bike
* Fetch all rides for a given cyclist
* Fetch all rides for a given bike
* Create rides in which the cyclist rides a bike that belongs to another cyclist
* _Maybe, if I have time, track maintenance items for each bike._

###"Should not" cases

I should not be able to:

* Create a cyclist that doesn't have an id, first name, and last name.
* Create a bike without an id and a cyclist id.
* Create a ride without an id, cyclist id, and miles.

###Requirements

* At least three models
* At least one one-to-many relationship
* At least one many-to-many relationship
* Unit tests for all business logic
* Ability to fully interact with the application from the browser