# Iseberg
##### A modern Ruby Client for the Cisco Identity Services Engine (ISE) External RESTful Service (ERS) API
***
Iseberg provides a modern, programmatic way to interact with the ISE ERS API.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iseberg'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iseberg

## Usage
```ruby
# Connect the client to your ISE PSN
ise_client = Iseberg::Client.new(PSN_IP, Username, Password)
# Get all endpoints known by ISE
ise_client.endpoint.get_all
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/abhid/iseberg.
