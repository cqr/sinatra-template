ENV['RACK_ENV'] ||= 'test'
app_file = File.join(File.dirname(__FILE__), *%w[.. .. application.rb])
require app_file
# Force the application name because polyglot breaks the auto-detection logic.
Sinatra::Application.app_file = app_file
require 'capybara/session'
require 'capybara/cucumber'
Capybara.app = Sinatra::Application
Capybara.default_selector = :css

Factory.definition_file_paths = [File.join(File.dirname(__FILE__), '..', 'factories')]
Factory.find_definitions

# Let's migrate our database automatically
ActiveRecord::Base.logger = Logger.new(nil)
ActiveRecord::Migration.verbose = true
ActiveRecord::Migrator.migrate("db/migrate")

Before do
  tables = ActiveRecord::Base.connection.tables
  tables.shift
  tables.each do |table|
    ActiveRecord::Base.connection.execute('DELETE FROM ' + table + ';')
  end
end