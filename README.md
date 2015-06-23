##Strava Lite

This application will be a tool for bike commuters or casual, non-spandex-clad recreational riders to track rides and equipment without all of the KOM nonsense that roadies love.

For example: I own three bikes, two of which I use on a regular basis. I don't care about speed or mileage precision, but I would like to track my approximate mileage per week for fitness, as well as how many miles I have ridden on each bike for maintenance purposes.

##Description

###users table
* id (primary key) - integer
* first_name - string
* last_name - string
* login - string
* password - string

###bikes table
* id (primary key) - integer
* user_id - integer
* bike_name - string
* description (optional) - string

###rides table
* id (primary key) - integer
* ride_name (optional) - string
* user_id - integer
* bike_id - integer
* miles - decimal
* time - datetime


###"Should" cases

Here's what I want to be able to do:

Create users
Edit user information
View user profile
Delete users
Create / update / delete bikes and descriptions
Assign bikes to a user
Fetch all bikes for a given user
Create rides
Assign rides to a user
Assign rides to a bike
Fetch all rides for a given user
Fetch all rides for a given bike

Maybe, if I have time, track maintenance items for each bike.

###"Should not" cases

I should not be able to:

Create a user that doesn't have an id, first name, last name, login, and password. 

Create a bike without an id and a user id.

Create a ride without an id, user id, and miles.