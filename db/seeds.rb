require 'faker'

# Creating 40 fake books
40.times do
  book = Book.new({
    author: Faker::Book.author,
    title: Faker::Book.title,
  })
  book.save
end


# Creating 40 fake users
40.times do
  user = User.new({
    email: Faker::Internet.email,
  })
  user.save
end
