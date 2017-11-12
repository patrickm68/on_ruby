# OnRuby

[![Build Status](https://img.shields.io/travis/phoet/on_ruby/master.svg)](https://travis-ci.org/phoet/on_ruby)

[Status & Uptime](http://status.onruby.eu/)

[Get in touch in our Slack Channel](https://slack-onruby.herokuapp.com/)

Source for the Sites of the Ruby Communities:

* [Hamburg](http://hamburg.onruby.de)
* [Cologne](http://cologne.onruby.de)
* [Saarland](http://saar.onruby.de)
* [Berlin](http://www.rug-b.de)
* [Leipzig](http://leipzig.onruby.de)
* [Karlsruhe](http://karlsruhe.onruby.de)
* [Dresden](http://dresden.onruby.de)
* [Railsgirls Hamburg](http://railsgirlshh.onruby.de)
* [Bonn](http://bonn.onruby.de)
* [Innsbruck](http://innsbruck.onruby.at)
* [Madrid](http://madridrb.onruby.eu)
* [Munich](http://munich.onruby.de)

## Installation

You can install OnRuby using Docker or a local installation.

### Install using Docker

Install [Docker and Docker Compose](https://docs.docker.com/compose/install/)
if you haven't already. Then:

```sh
docker-compose build
docker-compose up

script/in_docker bundle exec rake db:setup
```

> `sudo` might be required for `docker-compose` if you run Docker locally on Linux.

This creates three Docker containers:

- `web` for the application
- `box` for storing rubygems installations
- `db` for the PostgreSQL database

The `script/in_docker` allows you to run commands inside the Docker
container.

*Example*: Running a spec inside the Docker container

```sh
script/in_docker bundle exec rspec spec/requests/labels_spec.rb
```

Access via [http://www.onruby.dev:5000](http://www.onruby.dev:5000)

### Install locally

### On your machine

#### Install PostgreSQL

```sh
# Install PostgreSQL on macOS
brew install postgresql
# or on Ubuntu
sudo apt-get install postgresql postgresql-contrib

# Check if it's running
psql postgres # exit with \q

# Create user and database
createuser -Ps postgres
rake db:setup
```

Use `script/server` to run Rails locally, otherwise you need to export the
environment options yourself:

    bundle --without=production
    script/server

### Add hosts to `/etc/hosts`

For working with the whitelabel functionality, you need to add all supported
subdomains to your `/etc/hosts`:

```
127.0.0.1    www.onruby.dev hamburg.onruby.dev cologne.onruby.dev saar.onruby.dev
127.0.0.1    berlin.onruby.dev karlsruhe.onruby.dev leipzig.onruby.dev dresden.onruby.dev
127.0.0.1    railsgirlshh.onruby.dev bonn.onruby.dev madridrb.onruby.dev munich.onruby.dev
```

Access via [http://www.onruby.dev:5000](http://www.onruby.dev:5000)

### Test Data

You don't need any test data to set up a new project!

If you want to have some kind of seed, use this Rake task, to generate some
test data:

    rake data:create

If you are a Heroku project admin, you can dump Data from Heroku via [Taps
Gem](https://devcenter.heroku.com/articles/taps):

    heroku pg:pull HEROKU_POSTGRESQL_MAROON_URL onruby_development

## THE GUIDE TO YOUR RUG

These are the steps to get your Ruby Usergroup Site:

- Fork this repo
- Run `bundle && bundle exec rake fork:usergroup[MyUsergroup]`
- Create a GitHub Pull Request
- *Lean back and wait :)*

If you have a custom domain, you need to set up the [CNAME of your domain to
point to Heroku](https://devcenter.heroku.com/articles/custom-domains#dns_setup).

On the admin site we need to:

- `heroku domains:add xyz.onruby.de [custom.de]`
- create a new GitHub app for that domain and add keys via `heroku config:add`
- merge the Pull Request
- deploy to Heroku
- add admin privileges to someone for the new RUG

## Website

![OnRuby Website](http://cl.ly/image/3U0S3b0T0F0x/Screen%20Shot%202014-01-07%20at%2014.16.44.png)

## Admin Interface

The app comes with a [Typus](https://github.com/fesplugas/typus) interface to
manage the model data.

In order to access the admin stuff, you need to be a registered user with the
"admin role".

Typus is mounted under `/admin` of your label, so it's
`http://hamburg.onruby.de/admin` for Hamburg.

### Stuff to manage (CRUD)

- **Users**
- **Events**
    - **Materials**
- **Locations** and **Companies** (Companies are just special Locations)
- **Topics** (Subjects for activities that users can request or propose)
- **Jobs** (These are displayed at top of the page)
- **Highlights** (Special information that you want to display for a short period of time)

## License

"THE (extended) BEER-WARE LICENSE" (Revision 42.0815): [phoet](mailto:ps@nofail.de) contributed to this project.

As long as you retain this notice you can do whatever you want with this stuff.
If we meet some day, and you think this stuff is worth it, you can buy me some beers in return.
