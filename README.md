# CloudFlareLocalizable

If you're using CloudFlare you can easily get the country information of users requesting your
application. Just include CloudFlareLocalizable in your controller.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cloudflare_localizable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cloudflare_localizable

## Usage

You should include `CloudFlareLocalizable` in any Rails controller that needs country information.
You get a helper method called `cf_country` to be used whenever you need to know the country of the
user.

```ruby
class ExampleController < ApplicationController
  include CloudFlareLocalizable

  def index
    cf_country.code # => "BB"
    cf_country.name # => "Barbados"
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run
the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new
version, update the version number in `version.rb`, and then run `bundle exec rake release`, which
will create a git tag for the version, push git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/rikas/cloudflare_localizable.


## License

The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
