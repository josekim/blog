# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do
  Tag.find_or_create_by({name:Faker::Pokemon.name})
end


150.times do |x|
  post = Post.create({title:Faker::Lorem.words(4).join(" "),body:Faker::Lorem.words(42).join(" ")})
  post.tags << Tag.find((x/10)+1)
  post.tags << Tag.find((x/10)+5)
end
