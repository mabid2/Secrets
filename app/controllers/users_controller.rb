class UsersController < ApplicationController


  def new
    render 'users/new'
  end
  def create
    # binding.pry
    @user = User.create(user_params)
    # binding.pry
    session[:user_id] = @user.id
    redirect_to "/users/#{@user.id}"
  end
  def show
    @user = User.find_by(id: params[:id])
  end
  def secret
    @secret = Secret.create(user: current_user, content: params[:content])
    render "users/secrets"
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
