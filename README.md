# CloudFlareLocalizable

If you're using [CloudFlare](https://www.cloudflare.com/) you can easily get the country
of users requesting your pages. This is a very basic gem to help you get the country information in
your Rails applications when you're using CloudFlare services.

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

Because it is a helper method you can use it in the views if you want.

```html
<ul>
  <li>Code: <%= cf_country.code %></li>
  <li>Name: <%= cf_country.name %></li>
</ul>
```

### What happens if we can't get the country information?

If something goes wrong, or the client is trying to spoof an unknown location, or CloufFlare can't
get the country information for a given IP address then you get code `XX` and name `Unknown`.

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
