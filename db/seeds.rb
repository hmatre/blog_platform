# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.create!(email: 'admin@example.com', password: 'password') unless User.find_by(email: 'admin@example.com')

10.times do
  user = User.create(email: Faker::Internet.email, password: 'password')
  3.times do
    post = user.posts.create(
      title: Faker::Book.title,
      body: Faker::Lorem.paragraphs(number: 5).join("\n"),
      views: rand(1..500)
    )
    post.tag_list.add(Faker::Book.genre)
    post.save
  end
end