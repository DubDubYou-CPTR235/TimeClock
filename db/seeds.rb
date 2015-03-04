# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
user = User.create! :email => 'user@timeclock.com', :password => 'password', :password_confirmation => 'password'
user = User.create! :email => 'admin@timeclock.com', :password => 'dubdub1892', :password_confirmation => 'dubdub1892', :admin => 'true'
