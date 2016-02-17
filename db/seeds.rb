# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Bike.destroy_all

100.times do
Bike.create(description: Faker::Lorem.sentence,
            address: Faker::Address.street_name,
            city: Faker::Address.city,
            kind: ["VTT", "tandem", "ville"].sample,
            user_id: [1].sample)
end






# Bike.create(description: "VTT de compet"
#             address: "Rue de la convention",
#             helmet: true, zip: "75015",
#             city: "Paris",
#             kind: "VTT",
#             user_id: 1)
# Bike.create(description: "Velo hollandais", address: "Rue paradis ", helmet: false, zip: "4000", city: "Nantes", kind: "ville", user_id: 1)
