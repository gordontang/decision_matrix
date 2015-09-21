# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Decision.create!(id: 1, name: "Oven")
Decision.create!(name: "Cat")
Decision.create!(name: "Dog")
Decision.create!(name: "Pie")
Decision.create!(name: "Lawnmower")
Decision.create!(name: "Lawyer")

Alternative.create!(decision_id: 1, name: "Toaster")
Alternative.create!(decision_id: 1, name: "Microwave")
Alternative.create!(decision_id: 1, name: "Pressure cooker")

# generate alternatives
decisions = Decision.order(:created_at).take(6)
50.times do
	name = Faker::Lorem.word
	decisions.each { |decision| decision.alternatives.create!(name: name) }
end