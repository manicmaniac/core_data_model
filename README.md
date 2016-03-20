# CoreDataModel

[![Build Status](https://img.shields.io/travis/manicmaniac/core_data_model/master.svg)](https://travis-ci.org/manicmaniac/core_data_model)
[![Coverage Status](https://img.shields.io/coveralls/manicmaniac/core_data_model/master.svg)](https://coveralls.io/github/manicmaniac/core_data_model?branch=master)
[![Code Climate](https://img.shields.io/codeclimate/github/manicmaniac/core_data_model.svg)](https://codeclimate.com/github/manicmaniac/core_data_model)

Highly customizable Swift code generator for CoreData models.

Inspired by [mogenerator](https://github.com/rentzsch/mogenerator).

## Installation

```ruby
gem 'core_data_model'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install core_data_model

## Usage

```sh
core-data-model generate /path/to/.xcdatamodeld /path/to/output/
```

## Customize Template

You can give your template file as `--template-file` option to command line.

```sh
core-data-model generate --template-file /path/to/template /path/to/.xcdatamodeld /path/to/output/
```

The template is an [eRuby](https://en.wikipedia.org/wiki/ERuby) script.

Already includes [activesupport](https://github.com/rails/rails/tree/master/activesupport) for convenience.

The local variable named `entity` -- `NSEntityDescription` implementation in Ruby -- is pre-defined.

`entity` behaves like its Objective-C implementation, but without some functionalities.

The documentations haven't been prepared yet, but the default template file [HERE](/manicmaniac/core_data_model/blob/master/data/core_data_model/entity.swift.erb) would be a good example.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub [repo](https://github.com/manicmaniac/core_data_model).


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
