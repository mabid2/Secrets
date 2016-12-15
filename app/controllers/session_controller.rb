class SessionController < ApplicationController
  def new
    session[:user_id] = nil
    render 'sessions/new'
  end
  def create
    # session[:user_id] = params[:name]
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/users/#{user.id}"
    else
      flash[:errors] = ["Invalid combination"]
      redirect_to '/session/new'
    end
  end
  def checkuser
    session[:user_id] = User.authenticate(name, email, password)
  end
  def logout
    session[:user_id] = nil
    redirect_to 'users/new'
  end
end
