class User < ApplicationRecord
	validates :user_name, presence: true
	validates :password, presence: true
	validates_format_of :email,:with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
end
