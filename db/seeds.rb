# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Bike.create(address: "Rue de la convention", helmet: true, zip: "75015", city: "Paris", kind: "")
Bike.create(address: "Rue paradis ", helmet: false, zip: "4000", city: "Nantes", kind: "ville")
