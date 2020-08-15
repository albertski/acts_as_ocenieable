# Acts as Ocenieable

Acts as Ocenieable is a Ruby Gem written for adding ratings to Rails/Active
models. Ocenie in Polish means rating or review.

## Why Ocenieable

Acts as Ocenieable gem provides an easy way to give different ratings based on
the ActiveRecord Model. For example, your movie reviews may have directing and
acting review categories, but your app review will not have those.  Also, within
your ActiveRecord model, you may have different reviews based on a category. For
example, a science fiction book may have different rating categories vs. a
non-fiction book.

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

Act As Ocenieable uses the ocenies table to store all ratings. Run the following
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

### Views

Inside your Active Model's form, render the ocenieable form:

```ruby
  <%= render "forms/acts_as_ocenieable_form", form: f %>
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
