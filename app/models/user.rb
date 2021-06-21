class User < ApplicationRecord
    has_secure_password
    has_many :favorites
    has_many :activities, through: :favorites
    validates :username, presence: { message: "%{value} is required"}
    validates :password, presence: { message: "%{value} is required"}, on: :create
    validates :imageUrl, presence: { message: "%{value} is required"}
    validates :username, uniqueness: { message: "%{value} is already taken. Please choose another."}
end
