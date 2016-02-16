# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bike.destroy_all
Bike.create(address: "Rue de la convention", helmet: true, zip: "75015", city: "Paris", kind: "", user_id: 1)
Bike.create(address: "Rue paradis ", helmet: false, zip: "4000", city: "Nantes", kind: "ville", user_id: 1)
