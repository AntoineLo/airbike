# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bike.destroy_all

Bike.create(description: "VTT de compet",
            address: "Rue de la convention, 75010, Paris",
            helmet: true,
            kind: "VTT",
            user_id: 1)
Bike.create(description: "Velo hollandais",
            address: "Rue paradis, 40000, Nantes",
            helmet: false,
            kind: "Ville",
            user_id: 1)
Bike.create(description: "Tandem",
            address: "Rue Beaurepaire, 75010, Paris",
            helmet: true,
            kind: "Tandem",
            user_id: 1)
Bike.create(description: "VTT de montagne",
            address: "Courchevel",
            helmet: false,
            kind: "VTT",
            user_id: 1)
Bike.create(description: "Vélo de ville New-Yorkais",
            address: "54th Street, Manhattan, New-York City",
            helmet: false,
            kind: "Ville",
            user_id: 1)
