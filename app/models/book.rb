class Book < ActiveRecord::Base
  belongs_to :user, through: :collections
end
