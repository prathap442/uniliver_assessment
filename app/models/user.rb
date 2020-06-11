require 'bcrypt'
class User < ApplicationRecord
  attr_accessor :password
  validates :loginid, :presence => {:message => ERROR_NOTIFIER['loginid_blank']}
  validates :loginid, :uniqueness => {:message => ERROR_NOTIFIER['loginid_exists']}
  validate :hashify_the_password, on: :create
  def hashify_the_password
    if password
      self.salt = BCrypt::Engine.generate_salt
      self.encrypted_password= BCrypt::Engine.hash_secret(password, salt)
    else
      self.errors.add(:encrypted_password, ERROR_NOTIFIER["password_blank"])
    end
  end

  def self.authenticate_login_credentials(loginid,password)
    return { errors: ["The auth credentials are a must"], msg: "unsuccessful", x_auth: ''  } unless (loginid && password)
    u1 = self.find_by(loginid: loginid)
    encrypted_password = BCrypt::Engine.hash_secret(password, u1.salt)
    if u1.encrypted_password == encrypted_password
      return { errors: [],msg: "successful",x_auth: AUTH_KEY}
    end
    return { errors: [ERROR_NOTIFIER['wrong_password']], msg: "unsuccessful", x_auth: '' }
  end

end
