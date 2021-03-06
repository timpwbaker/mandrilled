# Mandrilled

Mandrilled is a simple application for accepting and displaying Mandrill
analytics event data.

It has one endpoint for receiving data `/events` that expects to receive a post
containing Address, EmailType, Event and Timestamp (unix) parameters. 

It has another endpoint for displaying data `/dashboard`, also found at the
root path. Here you can also filter by date.

Finally you can view real time events here `/real_time_events`, there is a
button to request dummy data sent by https://get-me-mandrill.herokuapp.com

## Architecture

The application has a single persisted data type, an event. Events can be
created by posting to `/events` as outlined above, they cannot be edited or
destroyed.

Event data can be viewed on the dashboard. The dashboard is a singular resource
found at `/dashboard`. One local variable is passed to `dashboard#show`, an
instance of the DataMiner class. This object holds all of the logic relevant to
querying event data and displaying it to the user.

## Setup

The application is Ruby on Rail 5.1 backed by a Postgres DB. So install
postgres, details here: https://wiki.postgresql.org/wiki/Detailed_installation_guides

Then

    bundle exec rails db:create
    bundle exec rails db:migrate

If you want some dummy sample data

    bundle exec rails db:seed

Run the app

    bundle exec rails s

## Tests

Tests are RSpec, run them with

    rspec

Simple Cov will tell you how much of the application is executed by the tests

    rspec
    open coverage/index.html

## CI and automated review

The application is setup for CircleCI, and heroku auto deploys master on
green

    https://circleci.com/gh/timpwbaker/mandrilled

The application is also evaluated by Code Climate

    https://codeclimate.com/github/timpwbaker/mandrilled

# Todo

Some things to consider for the future:

* The mobile front end leaves much to be desired.
* It would be nice to have a real time event stream on the dashboard
* There is currently no belongs_to on events, it is one bucket. Dashboard is
also a singular resource acting on all events. Fine for the purpose, but could
limit future usage.
* This application would require some kind of auth in production.
* Currently events posted to the `/events` endpoint that cannot be successfully
  turned into Event objects and saved are silently discarded. In future it may
be required to log these in some way.

# Other considerations

I have used bootstrap for styles, just to get up and running, but this has been
contained to one bootstrap_extraction file so could be replaced with another
templating library relatively easily.

Charts on the dashboard are generated by Chart.js, which in turn requires jQuery.
This is a relatively heavyweight dependency for such a basic application but its
use has been restricted to one view partial, so it would be easy to switch out
with another charting library, or remove completely, so I consider the risk to
be low.

Events are built by instances of the EventBuilder class. I chose to extract this
as the data coming in is not controlled by us, and could change (due to the 
mandrill API for example).
