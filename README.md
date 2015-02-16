# Sndicate [![Build Status](https://travis-ci.org/Sndicate/sndicate.svg?branch=master)](https://travis-ci.org/Sndicate/sndicate)

> If you only blog then it's only a blog... Be an author. Run a syndication hub. Do both with Sndicate.

## DEPRECATION NOTICE

This repository holds the code for the original Sndicate project. This project has now been deprecated. We have moved to Node.js and the project's priorities and goals have shifted. This repo is here for posterity only. Feel free to use it as the base for a Ruby blog engine. We won't be updating this anymore. See [the new Official Sndicate project](https://github.com/Sndicate/sndicate) for the latest code.

__Note:__ Don't try to run pre-0.1.x versions expecting them to function sanely. They're development-only pre-releases. They won't break your computer but that's about all the guarantees you'll get.

Sndicate is a publishing engine (blog/CMS) built on the concepts set forth in the [Sndicate Spec](http://sndicate.org/TODO) (TODO: Publish spec).

## Setup

### Requirements

* Ruby 1.9.3+ (2.0.0 is not supported yet but 2.1.x is) w/Rubygems
    - It is recommended that you use RVM or rbenv with a dedicated gemset
    - Bundler gem
* Mac OS X, Linux, or other POSIX system (Windows *could* work but hasn't been tested)
* MySQL 5+

### Installation

Installing in production and development is almost identical except for one flag which is noted here. There is a gem in the works that will automate much of the setup process.

    $ git clone git clone https://github.com/Sndicate/sndicate.git && cd $_
    # Be sure to have your Ruby environment set up at this point (version and gemset)
    $ bundle install --without-production # Use --without-production flag when in development
    $ cp snd_config.sample.yml snd_config.yml # You need to change the config file's name before use - fill it out too
    $ rake db:create # Create a development database
    $ rerun 'rackup' # Open a browser to http://localhost:9292 to see it in action

## Usage

### Configuration

Change the settings found in `snd_config.sample.yml` then rename the file to `snd_config.yml` before running for the first time. It's kind of like when you configure Wordpress for the first time.

### Routes

TODO: Fill out with starter usage info

The controllers (inside `core/controllers`) contain the routes used by the application. The `config.ru` file initializes each controller which in turn routes the rest of a request to the proper method. For example, `localhost:9292/dash` will route the request to the `DashController` (`core/controllers/dash_controller.rb`) and run the `'/'` method. That method will see you aren't logged in and send you to the login page.

So, basically, each controller file's name before the first underscore is a route (i.e. `dash_controller` becomes just '/dash') and each part of the URL after the controller is a method within that route file. Standard stuff, really. Check out the [Sinatra docs](http://www.sinatrarb.com/intro.html) to learn more about routes and controllers. Sndicate uses Sinatra at its core.

### Tasks

There are quite a few setup tasks

### Running tests

Running `rake` itself will run the tests. If that gives you problems try `rake spec`.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

## Docs and info

Documentation is generated by YARD. Human-written documentation is needed and in the works for inclusion on the project website.

TODO: Fill out docs info.

## License

MIT. See [License](License).
