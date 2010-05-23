Given /^I have (\d+) (.+)?$/ do |number, klass|
  number.to_i.times { Factory.create klass.underscore.singularize }
end

Given /^I have the following (.+):$/ do |klass, table|
  table.hashes.each do |params|
    Factory.create klass.underscore.singularize, params
  end
end