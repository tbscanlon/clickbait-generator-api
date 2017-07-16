# Clickbait Generator API

Get the title for your next viral listicle using this one weird API!

[See it in action here](https://clickbait-generator.herokuapp.com).

Some features include:
- A RESTful API (I think it's RESTful anyways).
- A one-pager with an AJAX-powered demo and some quick documentation.
See the project spec below for more detailed information.

This was a fun challenge for me to do. I have wanted to make an API for a while now, because I have another one or two projects I want to do in the future that require the use of this API. The code powering my API is currently rather simple; it just joins two randomly sampled parts of a sentence together and returns it as a JSON object. I also have ideas for expanding this API in the future.

TDD was the main challenge this time. I attempted to stub out my DataMapper objects for some of my unit tests, but after a lot of trial and error I couldn't get it to work. I was able to find a middle ground by using Rspec's `config.before(:suite)` option to insert dummy data into my DB before each test. I had planned on using more JavaScript and TDD'ing that as well, but after throwing in some jQuery to see what happens I realised that I had actually solved my problem already. I decided it would be quicker to simply refactor it.

Tech used in this challenge:
- Sinatra
- DataMapper
- PostgreSQL
- jQuery
- Rake

## Installation
1. Set up the following two databases in PostgreSQL: `clickbait_development` and `clickbait_test`.
2. Clone this repo by running `git clone git@github.com:tbscanlon/side-project-challenge.git`.
3. Install dependencies by running `bundle install` (you may need to `gem install bundle`).

## Usage

### Launching
1. Run `rackup -p 4567` in the project folder.
2. Open your favourite web browser (older versions of IE probably won't work) and navigate to `localhost:4567`

### Accessing the API
1. Send a GET request to `localhost:4567/api` to get a JSON object with a random title.
2. Send a GET request to `localhost:4567/api/<number>` to get a JSON object with a semi-random title (e.g. `localhost:4567/api/10`).

## Code Examples

### Creating a Title
```ruby
# ./app/models/listicle.rb
def generate(num = rand(2..50))
  { title: construct_string(num) }
end

private
def construct_string(num)
  "#{get_content(prefixes)} #{get_content(suffixes)}".
  gsub("_number_", num.to_s)
end

def get_content(text)
  text.sample.content
end
```

### Serving JSON with Sinatra
```ruby
# ./app/controllers/api.rb
get '/api' do
  headers 'Access-Control-Allow-Origin' => '*'
  content_type :json
  listicle.generate.to_json
end
```

### Populating the DB with Rake
```ruby
# ./Rakefile
namespace :db do
  # ... DataMapper AutoUpgrade and AutoMigrate Rake tasks ...

  desc "Populate Prefix table"
  task :populate_prefix do
    CSV.foreach("app/public/csv/prefixes.csv") do |item|
      Prefix.create(content: item.join)
      puts "Added #{item} to table"
    end
  end

  desc "Populate Suffix table"
  task :populate_suffix do
    CSV.foreach("app/public/csv/suffixes.csv") do |item|
      Suffix.create(content: item.join)
      puts "Added #{item} to table"
    end
  end
end
```

### Entering Dummy Data for Tests using RSpec
```ruby
# ./spec/spec_helper.rb
RSpec.configure do |config|
  # ... config ...

  config.before(:each) do
    DatabaseCleaner.start
    Prefix.create(content: "Top _number_ ways to")
    Suffix.create(content: "run tests.")
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end
end
```

## Project Spec

The Clickbait Generator is an API for retreiving a randomised text string that mimics the listicle titles used by the likes of Buzzfeed, The Huffington Post and Time. The generator can do the following:
- Join together a a random sentence prefix and suffix for output.
- Be accessed using a RESTful API. My hope is someone will use this useless API for something equally useless of their own.

There's also a web front-end, with the following features:
- Some documentation on how to use the API.
- A live demo, using AJAX to fetch a new title asynchronously.
- *Maybe* social media sharing buttons. We'll see if I get round to it.

## User Stories
```
As a User,
So that I can get a sentence suffix,
I would like to be able to retreive one from somewhere.
```

```
As a User,
So that I can get a sentence prefix,
I would like to be able to retreive one from somewhere.
```

```
As a User,
So that I can form a complete sentence,
I would like to be able to join a prefix and suffix together.
```

```
As a User,
So that I can have a very large number of possible sentences,
I would like to be able to have a random number inserted into the sentence.
```

```
As a User,
So that I can show my friends how ironic and cool I am,
I would like to be able to share my clickbait title over Twitter.
```

```
As a Developer,
So that I can access a clickbait title from anywhere,
I would like to be able to make a GET request to a route.
```

```
As a Developer,
So that I can use a clickbait title anywhere,
I would like to be able to get a title as a JSON object.
```
