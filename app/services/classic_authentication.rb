class ClassicAuthentication
  def self.authenticate(loginId, password)
    user = User.find_by(loginId)
    user.salt
  end
end