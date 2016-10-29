class User < ApplicationRecord
	validates :user_name, presence: true, uniqueness: true
	validates :password, presence: true
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :email, uniqueness: true

  def self.exists_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']).present?
  end

	def self.sign_in_from_omniauth(auth)
		find_by(provider: auth['provider'], uid: auth['uid'])
	end

  def self.create_new_from_omniauth(auth)
    new(
        provider: auth['provider'],
        uid: auth['uid'],
        first_name: auth['extra']['raw_info']['first_name'],
        last_name: auth['extra']['raw_info']['last_name'],
				email: auth['info']['email']
    )
  end
end
