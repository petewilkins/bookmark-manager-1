require 'bcrypt'

class User

  include DataMapper::Resource
  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :email, String, format: :email_address
  property :password_digest, Text

  validates_confirmation_of :password
  validates_presence_of :email 

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
