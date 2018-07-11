Choons Web App
=========

A sample web application that allows a user to manage songs in their library. This is just a demonstration of an integration between a React front end and a Nodejs-based REST API backend. As is, the app consists of a simple React server on the front end that retrieves a list of songs associated with a hard-coded user via a Hapi-based API on the backend. Those songs are then rendered in the browser in a table that allows you to click column headings to sort by any field. You may also filter by song title, artist, and album. Note that this is a preset list of songs served from a database behind the API. While you cannot add to the master list of songs or to a user's list of songs via the UI, you may do so via the API using curl if you feel so inclined.  

The backend was created using [this templating tool](https://github.com/nguilford/node-project).

## Dependencies

- [Docker version](https://docs.docker.com/engine/installation/) 17.06.0+
- [Docker Compose](https://docs.docker.com/compose/install/) version 1.16.0+
- GNU make (optional)

This was tested on OSX 10.11.6 and Ubuntu Trusty, but should work on any system that supports and is running the versions of Docker listed above.

## To run

If you have `make` installed, run the following command from the root of this repo:

`make run`

If you do not have `make` installed, run the following command from the root of this repo:

`docker-compose --file ./build/docker-compose.yml up`

This will take awhile the first time you run this, as the app must build all the dependencies. Once you see `Compiled successfully! You can now view choons-frontend in the browser`, just point your browser to http://localhost:3000 to view and use the app.

Note that this assumes your browser is running in the same environment as the Choons app. If your browser is running on your host, but the app is running inside of a VM underneath your host, make sure you have ports forwarded as appropriate.
