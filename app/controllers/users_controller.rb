class UsersController < ApplicationController
  def verify
    loginid = params['user']['loginid']
    password = params['user']['password']
    @authenticated = User.authenticate_login_credentials(loginid, password)
    respond_to do |format|
      format.js 
    end
  end

  def login
    @user = User.new
  end

  def success_login
    
  end
  
end
