# Active Record CRUD Operations Lab

## Learning Goals

- Perform CRUD operations on a SQL database table using Active Record

## Introduction

The goal of this lab is to get comfortable performing CRUD (Create, Read,
Update, Delete) actions using Active Record.

There are different ways to solve this lab so feel free to experiment!

## Setup

First, run `bundle install` to install the dependencies from the Gemfile.

Next, run `bundle exec rake -T`, which will list all of the rake tasks you have
available in this lab. These tasks come with the `sinatra-activerecord` gem.
2
Start the lab by running `learn test` or keep reading for more instructions.

## Create Table

Try using a Rake task to create your migration file:

```console
$ bundle exec rake db:create_migration NAME=create_shops
```

Once you have a migration file, add columns like so:

| Column Name  | Type      |
| ------------ | --------- |
| title        | (string)  |
| opening_date | (integer) |
| owneer       | (string)  |

After your migration is ready, run both these commands:

```console
$ bundle exec rake db:migrate
$ bundle exec rake db:migrate RAKE_ENV=test
```

This will migrate your development database as well as a test database so you
will be able to run `learn test`.

You can also run this command to generate some sample data:

```console
$ bundle exec rake db:seed
```

This will run the code in the `db/seeds.rb` file in order to create some shops.

Then, if you want to try out your code in the console, run:

```console
$ bundle exec rake console
```

Use the console to explore various Active Record methods that you'll need in
order to pass the tests.

## Instructions

Run `learn test` to see the tests. You'll be adding new methods to the `shop`
class in `app/models/shop.rb` that take advantage of Active Record's build-in
functionality.

The goal of this is to add some functionality to your `shop` class while taking
advantage of Active Record's built-in methods. For example, you might write a
method `shop.find_all_shops_by_year` that finds all the shops for a given
year:

```rb
class shop < ActiveRecord::Base
  def self.find_all_shops_by_year(year)
    shop.where(year: year)
  end
end
```

`.where` is a built-in Active Record method that queries the database and
returns a list of all items that match the criteria being passed as an argument.

Each test will take us through performing a basic CRUD action using the database
we just created. You'll need to refer to the [Active Record Query
Interface][querying] documentation to find the best methods to use.

**Note**: Pay attention to which methods are instance methods (`#`) and which
are class methods (`.`).

### Create

- `shop.create_with_title`: instantiates a shop with a given title, and saves
  it to the database

### Read

- `shop.first_shop`: returns the first item in the table
- `shop.last_shop`: returns the last item in the table
- `shop.shop_count`: returns the number of records in the table
- `shop.find_shop_with_id`: returns a shop from the table based on its id
  with the `.find` method
- `shop.find_shop_with_attributes`: returns a shop from the table based on
  its attributes with the `.find_by` method
- `shop.find_shops_after_2002`: uses a `.where` clause to select the
  appropriate shops released after 2002

### Update

- `shop#update_with_attributes`: updates a single shop using the `#update`
  method
- `shop.update_all_titles`: updates the title of all records at once using the
  `.update` method

### Delete

- `shop.delete_by_id`: deletes a single item with the `#destroy` method
- `shop.delete_all_shops`: deletes all items at once with the `.destroy_all`
  method

## Resources

- [Active Record Query Interface][querying]

[querying]: https://guides.rubyonrails.org/active_record_querying.html
