# Fog::Networking

Module for the 'fog' gem to provide a simplified way to connect services between clouds

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fog-networking'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fog-networking

## Usage

Assumming you've created (or got) two instances the syntax is:

```ruby
  Fog::Networking::Services.connect_instances(instance_1, instance_2, port)
```

You can monitor what it's doing by using the Fog::Logger (which adds entries to STD_ERR if you set DEBUG=true in your environment variables).

Currently this only supports AWS -> Oracle Compute or Database Cloud. Feel free to contribute other scenarios through a pull request.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/joelith/fog-networking.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

