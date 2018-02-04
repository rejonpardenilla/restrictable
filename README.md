# Restrictable

Manage authorization restrictions on Ruby on Rails with [Devise](https://github.com/plataformatec/devise).
Ideal for controlling actions of 2 or 3 types of users.

Restrict user roles from doing specific actions on the controller with two simple controller helpers:

```ruby
only_allow :cutom_user_role, to: :some_action_in_the_controller
prevent :another_user_role, to: :some_other_action
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'restrictable'
```

And then execute:

    $ bundle


## Usage

After adding a `User` model with [Devise](https://github.com/plataformatec/devise#getting-started), run the following migration:

```
$ rails generate migration AddRoleToUsers role:integer
```

Your migration and model should look like this:

```ruby
class AddRoleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role, :integer, default: 0
  end
end
```

```ruby
class User < ApplicationRecord
  devise  :database_authenticatable, :recoverable,
          :rememberable, :trackable, :validatable,

  enum role: [:guest, :content_creator, :admin]
end
```

And now you can take advantage of the simple controller methods:

```ruby
class BuyOrdersController < ApplicationController
  only_allow :admin, to: :destroy
  prevent :guest, to: [:create, :update]

  def create
  end

  def update
  end

  def destroy
  end
end
```

## Advanced Usage

TODO: Add the complete usage method overrides and configurations.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Roadmap

TODO: Add a roadmap.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rejonpardenilla/restrictable. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Restrictable project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/restrictable/blob/master/CODE_OF_CONDUCT.md).
