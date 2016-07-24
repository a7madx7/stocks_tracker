class Friendship < ApplicationRecord
  belongs_to :user
  # magical class
  # real class is User
  belongs_to :friend, class_name: 'User'
end
