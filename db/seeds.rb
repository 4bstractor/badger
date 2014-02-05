# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Test users
test1 = User.create!(:username => "test1", :email => "test1@example.com", :password => "qwerty", :password_confirmation => "qwerty")
test2 = User.create!(:username => "test2", :email => "test2@example.com", :password => "qwerty", :password_confirmation => "qwerty")
test3 = User.create!(:username => "test3", :email => "test3@example.com", :password => "qwerty", :password_confirmation => "qwerty")

# Shared and extra entities
hill = Entity.create!(:name => "Hill", :address => "123 Test St", :users => [test1, test2, test3])
company = Entity.create!(:name => "Company", :address => "567 Example Ave", :users => [test1, test2])
church = Entity.create!(:name => "Church", :address => "8904 Sample Blvd", :users => [test1])
test1personal = test1.entities.first

# Create some test bills
Bill.create!(:entity => hill, :name => "Sand", :amount => 225.72, :recur_period => "quartly", :due_date => "19th", :users => [test1, test2, test3])
Bill.create!(:entity => hill, :name => "Gas", :amount => 418.32, :recur_period => "monthly", :due_date => "16th", :users => [test1, test2, test3])
Bill.create!(:entity => hill, :name => "Water", :amount => 651.63, :recur_period => "weekly", :due_date => "28th", :users => [test1, test2, test3])
Bill.create!(:entity => hill, :name => "Power", :amount => 1117.75, :recur_period => "bi-weekly", :due_date => "22nd", :users => [test1, test2, test3])
Bill.create!(:entity => test1personal, :name => "Food", :amount => 77.52, :recur_period => "bi-monthly", :due_date => "13th", :users => [test1])
Bill.create!(:entity => test1personal, :name => "Beer", :amount => 386.41, :recur_period => "monthly", :due_date => "2nd", :users => [test1])
Bill.create!(:entity => test1personal, :name => "Github", :amount => 654.03, :recur_period => "annually", :due_date => "23rd", :users => [test1])
Bill.create!(:entity => test1personal, :name => "Trash", :amount => 52.63, :recur_period => "tri-monthly", :due_date => "3rd", :users => [test1])
Bill.create!(:entity => test1personal, :name => "Fuel", :amount => 109.38, :recur_period => "tri-weekly", :due_date => "25th", :users => [test1])
Bill.create!(:entity => company, :name => "Wood", :amount => 558.11, :recur_period => "weekly", :due_date => "17th", :users => [test1, test2])
Bill.create!(:entity => company, :name => "Iron", :amount => 1061.94, :recur_period => "monthly", :due_date => "12th", :users => [test1, test2])
