source 'https://rubygems.org'

# hide our private details in env variables
gem 'dotenv-rails', :require => 'dotenv/rails-now'
# Twilio gem for text message sending
gem 'twilio-ruby', '~> 4.11.1'
# devise for user sign in and sign out etc.
gem 'devise'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.15'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Amazon web services
gem 'aws-sdk'



# Deletes expired posts through time-scheduled rake tasks
gem 'whenever', :require => false

# image uploading
gem 'paperclip'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# gem 'sass', '3.2.19'
# gem 'bower-rails'
  gem 'bower'
# gem 'angular-rails-templates'

# icons
gem 'font-awesome-sass'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'capybara-angular'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  gem "chromedriver-helper"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

gem "foreman"
group :production, :staging do
  gem "rails_12factor"
  gem "rails_stdout_logging"
  gem "rails_serve_static_assets"
end

group :test do
  gem 'rspec-collection_matchers'
  gem 'poltergeist'
  gem 'shoulda'
  gem 'shoulda-callback-matchers', '~> 1.1.1'
  gem 'timecop'
  gem 'sms-spec'
end
