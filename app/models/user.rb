class User < ActiveRecord::Base

	has_many :questions
	has_many :answers

	attr_accessor :password
	
	before_create :encrypt
	# validates :long_url, presence: true, :format => {:with => URI.regexp}
	# validates :long_url, uniqueness: true
	# validates :short_url, uniqueness: true

	def encrypt
		self.encrypted_password = BCrypt::Password.create(self.password)
	end

	def authenticate(password)
		BCrypt::Password.new(self.encrypted_password) == password
	end

end