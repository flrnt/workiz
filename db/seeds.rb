require 'faker'

Book.destroy_all
# Creating 40 fake books
40.times do
  book = Book.new({
    author: Faker::Name.name,
    title: Faker::Book.title,
  })
  book.save
end

User.destroy_all
# Creating 40 fake users
40.times do
  user = User.new({
    email: Faker::Internet.email,
  })
  user.save
end
