require 'bundler'
ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, (ENV['RACK_ENV'].downcase.intern))
$: << File.dirname(__FILE__)

class Environment
  def self.reload!
    [:models, :lib].each do |dir|
      Dir[File.join(File.dirname(__FILE__), dir.to_s, '*')].each do |file|
        send(ENV['RACK_ENV'] == 'development' ? :load : :require, file) unless File.directory? file
      end
    end
  end
end

Environment.reload!

dbconfig = YAML.load(File.read('config/database.yml'))

ActiveRecord::Base.establish_connection dbconfig[ENV['RACK_ENV'].downcase.underscore]


configure :development do
  before do
    Environment.reload!
  end
end

helpers TeamFun::Helpers