# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

p 'I destroy all comments'
Comment.destroy_all
p 'I destroy all events'
Event.destroy_all

p 'I create 20 upcoming events'
i = 0
20.times do
  event = Event.new(
    name: Faker::Music::RockBand.name,
    date: Faker::Date.between(from: Date.today, to: 40.days.from_now),
    email: Faker::Internet.email,
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
  )
  event.save
  i += 1
end

p 'I create 20 past events'
20.times do
  event = Event.new(
    name: Faker::Music::RockBand.name,
    date: Faker::Date.between(from: 40.days.ago, to: Date.today),
    email: Faker::Internet.email,
    description: 'Lorem ipsum dolor sit amet, consectetur adipisicing elit.'
  )
  event.save
  i += 1
end

p 'Finished !'
