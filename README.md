# PokemonApi

Pikachu, I choose you! Welcome to my first API/Cli project! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/pokemon_api`. To experiment with that code, run `bin/console` for an interactive prompt.

Currently, this program only goes as deep as to give the user the capability of finding out the abilities of a chosen pokemon from an abbreviated list of pokemon. I would like to expand upon it, of course. In so doing, the program would then access all 900+ pokemon. However, despite research, I was not able to write the correct code to access all that data. Moreover, I've created reader/writer methods for other attributes which are not utlized in the CLI itself. These redunancies have been commented out for you--the user--to critique and make suggestions in order to ammend, improve, and to give functionality in the refactoring process.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pokemon_api'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install pokemon_api

## Usage

It will tell you a list of pokemon from a site...but soon it will do much more. For instance, once you select the pokemon, then you can find out specific info on that pokemon, because you never know when you might need to know how a water type can beat an electric type...

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/pokemon_api. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/<github username>/pokemon_api/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the PokemonApi project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/<github username>/pokemon_api/blob/master/CODE_OF_CONDUCT.md).
