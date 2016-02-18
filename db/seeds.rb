# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bike.destroy_all

Bike.create(description: "VTT de compet"
            address: "Rue de la convention, 75010, Paris",
            helmet: true,
            kind: "VTT",
            user_id: 1)
Bike.create(description: "Velo hollandais", address: "Rue paradis, 40000, Nantes", helmet: false, kind: "ville", user_id: 1)
