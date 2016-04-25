# HatenaGroup

[![Build Status](https://travis-ci.org/sh19910711/hatenagroup.rb.svg?branch=master)](https://travis-ci.org/sh19910711/hatenagroup.rb)

The simple client library for hatena group.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hatenagroup'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install hatenagroup

## Usage

### Calendar

```ruby
require "hatenagroup"

calendar = HatenaGroup::Calendar.new("mygroup", ENV["HATENA_USER_ID"], ENV["HATENA_PASSWORD"])
d = calendar.day(Date.new(2016, 4, 1))
d.body = "Updated Text"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/sh19910711/hatenagroup.rb.

