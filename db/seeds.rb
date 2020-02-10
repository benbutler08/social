require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


assignment_names = %w[LinkedIn Facebook Instagram GooglePlus Blog]

assignment_names.each do |assignment_name| 
	Assignment.create({
		name: assignment_name, 
		description: Faker::Lorem.paragraph(sentence_count: rand(1..7 ))
	})
end 

assignments = Assignment.all 
status = %w[staging active complete]

assignments.each do |assignment|
	rand(1..10).times do 
		Task.create({
			title: Faker::Lorem.sentence,
			description: Faker::Lorem.paragraph(sentence_count: rand(10..30)),
			assignment_id: assignment.id,
			status: status.sample
		})
	end
end