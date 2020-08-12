# Acts as Oceniable

Acts as Oceniable is a Ruby Gem written for adding ratings to Rails/Active
models. Ocenie in Polish means rating or review.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'acts_as_ocenieable'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install acts_as_ocenieable

### Database Migrations

Act As Oceniable uses the ocenies table to store all ratings. Run the following
commands to generate and run migrations:

    rails generate acts_as_ocenieable:migration
    rake db:migrate

## Usage

### Ocenie Models

```ruby
class Movie < ActiveRecord::Base
  acts_as_ocenieable
end
```

### Controller

Add `ocenies_attributes` as an allowed attribute.

```ruby
def article_params
  params.require(:article).permit(:title, :description, category_ids: [], ocenies_attributes: {})
end
```

Call `build_ocenies` on your model for your `new` and `edit` methods.

```ruby
def new
  @article = Article.new
  @article.build_ocenies
end

def edit
  @article.build_ocenies
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/albertski/acts_as_ocenie. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/albertski/acts_as_ocenie/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open-source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ActsAsOcenie project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/albertski/acts_as_ocenie/blob/master/CODE_OF_CONDUCT.md).
