# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)




User.create(user_name: "Boarding Officer", access: "General Access", password: "1234")
User.create(user_name: "Security Dispatch", access: "Dispatcher", password: "1234")
User.create(user_name: "Security Management", access: "Management", password: "1234")
User.create(user_name: "Surveillance", access: "Surveillance", password: "1234")
User.create(user_name: "IT Department", access: "Admin", password: "1234")
