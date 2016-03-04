source 'https://rubygems.org'
ruby '2.1.5'
  
gem 'seed_dump'
gem 'pry'

gem 'paperclip', '~> 4.2'
gem 'wicked', '~> 1.1.1'
gem 'bootstrap-wysiwyg-rails'
gem 'email_validator'
gem 'high_voltage', '~> 2.2.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'mail'
#email validator
gem 'validates_email_format_of'

gem 'paperclip-dropbox', '>= 1.1.7'
gem 'paperclip-googledrive-new'

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Caching
gem 'redis-rails'
gem 'actionpack-page_caching'
gem 'actionpack-action_caching'

group :assets do
  gem 'jquery-datatables-rails'#, github: 'rweng/jquery-datatables-rails'
  gem 'jquery-ui-rails'
end

gem 'will_paginate'
gem 'momentjs-rails', '>= 2.8.1'
gem 'twitter-bootstrap-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.0.0'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.

gem 'bootstrap-sass', '~> 3.2.0'
gem 'autoprefixer-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
gem 'devise'
gem 'cancan'
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'slim'

 group :doc do
   gem 'sdoc', '~> 0.4.0'
 end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'unicorn'
  gem 'unicorn-rails'
  gem 'redis-rack-cache'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers', require: false
  gem 'simplecov', require: false
  gem 'factory_girl_rails', '~> 4.0'
  gem 'faker'

  gem 'letter_opener', require: false
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'spork'
  gem 'spork-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'

  gem 'watchr'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'capybara'

end