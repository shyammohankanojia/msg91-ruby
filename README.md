# Msg91
Msg91 is the basic ruby gem for https://msg91.com/ to send sms.
I tried to provide in ruby, sinse Msg91 did not have any support in ruby.
This gem is just return gift to MSG91


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'msg91'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install msg91

## Usage
This gem has one dependency, so add this in your Gemfile

gem 'excon'

After installing the gem you need to get following API access 
http://api.msg91.com/apidoc/textsms/send-sms.php

authkey, sender, route && country for MSG91 API is required.

Set there var in your system ENV file.

authkey = ENV['SMSAUTHKEY']

sender  = ENV['SENDER']

route   = ENV['ROUTE']

country = ENV['COUNTRY']

authkey * Alphanumeric  Login Authentication Key(This key is unique for every user)

message * Varchar Message Content to send

sender *  Varchar Receiver will see this as sender's ID

route * Varchar If your operator supports multiple routes then give one route name. 

Eg: route=1 for promotional, route=4 for transactional SMS.

-------------------------------------------
How to send sms?

After setting ENV vars, call following in anywhere to send sms.

Msg91::Client.text(mobile_number, message)


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/msg91. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

