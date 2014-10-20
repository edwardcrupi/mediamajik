# README #

This README documents the normal steps to get the MediaMajik app running, the app uses postgres rather than sqlite3 so be wary of that.

1. Navigate to the Application's directory.
2. Restore the backed up db by entering command ```psql -f MediaMajik_development.dumpfile MediaMajik_development``` OR create a new one by entering command ```rake db:create``` and then load it with ```rake db:schema:load``` and then seed the db with effects by entering ```rake db:seed```
3. Enter command ```rails s``` to start the webserver on your localhost (the default port is 3000).
4. Navigate to localhost:3000 on your browser to see the app running on the default port.

OR ALTERNATIVELY

1. Navigate to http://mediamajik.ninefold-apps.com/ to see the current version of the app deployed on ninefold.

### What is this repository for? ###

* Quick summary: This app is made as part of project 2 of the Software Modelling and Design class taught at the University of Melbourne
* Version: 0.0.0

### Todos ###

* ~~Finish off adding the components in the class diagram to the app~~.
* ~~Add ability to upload images~~
* ~~Add ability to apply filter to images~~
* ~~Add authentication.~~
* ~~Add versioning, either with paper-trail or using carrierwave.~~ *actually neither of these*
* ~~Add sharing.~~
* ~~Add galleries~~.
* ~~Add trash~~

### Notes ###
* Changed the structure of the app from what is listed in the class diagram:
	+ Got rid of the File->Image inheritance and just made them one class for simplicity.
	+ Got rid of the Effect->Filter inheritance and just made them one class for simplicity.
* Implemented versioning as a weird sort of linked list or stick structure.
### Class Diagram ###

![Class Diagram](Class-Diagram.png)
