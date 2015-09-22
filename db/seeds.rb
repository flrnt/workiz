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

# User.destroy_all
# User.reset_pk_sequence
# # Creating 40 fake users
# 40.times do
#   user = User.new({
#     email: Faker::Internet.email,
#     password: "supermotdepasse1",
#     password_confirmation: "supermotdepasse1",
#     current_sign_in_at: Time.now,
#     last_sign_in_at: Time.now,
#     created_at: Time.now,
#     updated_at: Time.now,
#   })
#   user.save!
# end


  # collection = Collection.new({
  #   user_id:2,
  #   book_id:8,
  #   available:true,
  # })
  # collection.save

