class User < ApplicationRecord
	validates :user_name, presence: true, uniqueness: true
	validates :password, presence: true
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :email, uniqueness: true
end
