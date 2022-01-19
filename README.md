# README

Sweater Weather Project:

This is a RESTful API backend for a hypothetical front-end. This API allows users to get weather forecast based on location along with a background image of that location to display. This API also allows for the creation of users and for sign-in functionality. It will also allow users to find the diriving time between two locations (roadtrip) and return the weather forecast at the estimated time of arrival.

Learning Goals:
* Consuming and aggregating multiple api's for a hypothetical front end
* Creating a comprehnsive test suite for this API
* Using multiple different request formats

How to set up:
* Fork and clone this repo
* Get the following API keys
- https://developer.mapquest.com/
- https://openweathermap.org/api
- https://unsplash.com/developers
- Store these API Keys as environment variables in your version with these names:
- mapquest_api_key:
- open_weather_api_key:
- unsplash_client_id:

Endpoints and how to use:
* For getting the forecast for a single location:
- Get api/v1/forecasts?location={location}
* For getting a background image based on a location:
- Get api/v1/backgrounds?location={location}
* For creating a new user:
- Post api/v1/users Note: Must send JSON body with email, password, and password confirmation fields
* For creating a new user session (sign in):
- Post api/v1/sessions Note: Must send JSON body with email and password fields
* For getting how long a roadtrip will take and the weather at the estimated time of arrival:
- Post api/v1/road_trip Note: Must send JSON body with origin, destination, and api_key fields (api_key is returned when creating a user and signing in)


