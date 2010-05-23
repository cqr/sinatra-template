source :gemcutter

# these gems are required.
gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'haml'
if RUBY_VERSION.to_f < 1.9
  gem 'sqlite3-ruby'
else
  gem 'sqlite3'
end

# You can add your own gems to this file
# and then run bundle install to make sure they
# are all there.

group :test do
  gem 'rspec', :require => 'spec/expectations'
  gem 'capybara'
  gem 'cucumber'
  gem 'factory_girl'
  gem 'launchy'
end