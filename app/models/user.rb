class User < ActiveRecord::Base
	attr_accessor :password
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :name, :presence => true, :length => { :in => 3..20 }
	validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
	validates :password, :presence => true 
	validates_length_of :password, :in => 6..20, :on => :create

	before_save :encrypt_password, :set_token, :set_date_created
	after_save :clear_password

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
		end
	end

	def set_token
		if not self.token
			self.token = (0...18).map { (65 + rand(26)).chr }.join
		end
	end

	def set_date_created
		if not self.date_created
			self.date_created = Time.now
		end
	end

	def clear_password
		self.password = nil
	end
end
