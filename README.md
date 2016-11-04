[![Build Status](https://travis-ci.org/sul-dlss/goobi-robot.svg?branch=master)](https://travis-ci.org/sul-dlss/goobi-robot)
[![Coverage Status](https://coveralls.io/repos/github/sul-dlss/goobi-robot/badge.svg?branch=add-coveralls-hound)](https://coveralls.io/github/sul-dlss/goobi-robot?branch=add-coveralls-hound)

# GoobiWF Robot Suite

Robot suite that handles notifying goobi via a web service call to dor-web-service


## Documentation

Check the [Wiki](https://github.com/sul-dlss/robot-master/wiki) in the robot-master repo.

## Dependences

Ruby 2.2.2

## Setup

1. Install gems:

```console
$ bundle install
```

2. Copy the example.rb config file to a development file and so you can run in development mode:

```console
$ cp config/environments/example.rb config/environments/development.rb
```

3. Edit `config/environments/development.rb` to setup connections to actual dor-web-service

## Running tests

External services are not called in the tests, everything is stubbed out, so you do not need actual connections to things.

```console
$ bundle exec rake
```

## Testing on the console

Specify the environment you want to use:

```console
$ bin/console development  
```

## Run a single robot on a specific druid

Specify the robot you want to run, also specify environment with -e flag and druid with -d flag.

If you want to run multiple druids, instead of specifying a single druid with a -d flag, you can specify a text filename as a -f flag, with one druid per line.

```console
$ bin/run_robot dor:goobiWF:goobi-notify -e development -d druid:bb027yn4436
```

## Deploy

```console
$ cap development deploy
$ cap staging deploy
$ cap production deploy
```
