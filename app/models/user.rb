class User < ApplicationRecord
	before_save :encrypt_password
	#image uploading
	mount_uploader :image, ImageUploader
	# Associations
	has_many :recipes
	# Validations
	validates :user_name, presence: true, uniqueness: true
	validates :password, presence: true
	validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :email, uniqueness: true
  # Methods
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
  

  def encrypt_password
    if password.present?
      if self.salt.present? == false
        self.salt = BCrypt::Engine.generate_salt
      end
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

end
