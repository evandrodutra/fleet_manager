# FleetManager

Simple command line program to find the number of Fleet Engineers necessary to operate vehicles.

## Installation

Clone the repository:

    $ git clone git@github.com:evandrodutra/fleet_manager.git
    $ cd fleet_manager

Install dependencies:

    $ bundle install

Install the gem locally:

    $ bundle exec rake install

## Usage

Executing calculations:

```bash
$ fleet_manager -s 15,10 -c 12 -p 5
fleet_engineers: 3
```

```bash
$ fleet_manager -s 11,15,13 -c 9 -p 5
fleet_engineers: 7
```

Listing command line options:

```bash
$ fleet_manager --help
usage: bin/fleet_manager [options]
    -s                          a list of scooters, example: 12,15,16
    -c                          Fleet Manager maintainability up to C scooters
    -p                          Fleet Engineer maintainability up to P scooters

other options:
    --min-districts             minimum districts, default: 1
    --max-districts             maximum districts, default: 100
    --min-scooters-in-district  minimum scooters in district, default: 0
    --max-scooters-in-district  maximum scooters in district, default: 1000
    --min-scooters-for-fm       minimum scooters for FM, default: 1
    --max-scooters-for-fm       maximum scooters for FM, default: 999
    --min-scooters-for-fe       minimum scooters for FE, default: 1
    --max-scooters-for-fe       maximum scooters for FE, default: 1000
    --version                   print the gem version
    --help                      list options
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
