require 'faker'

Collection.destroy_all

Book.destroy_all
40.times do
  book = Book.new({
    author: Faker::Name.name,
    title: Faker::Book.title,
    description: Faker::Lorem.paragraph(rand(1..20)),
  })
  book.save
end

User.destroy_all
40.times do
  user = User.new({
    email: Faker::Internet.email,
    password: "supermotdepasse1",
    password_confirmation: "supermotdepasse1",
    current_sign_in_at: Time.now,
    last_sign_in_at: Time.now,
    created_at: Time.now,
    updated_at: Time.now,
  })
  user.save!
end

u_ids = []
User.find_each do |user|
  u_ids << user.id
end

b_ids = []
Book.find_each do |book|
  b_ids << book.id
end

i = 0
40.times do
  collection = Collection.new({
    user_id: u_ids[i],
    book_id:b_ids[i],
    available:true,
  })
  collection.save
  i+=1
end
