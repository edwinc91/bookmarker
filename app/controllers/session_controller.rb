class SessionController < ApplicationController

  def create
    user = User.find_by(name: user_params[:name])

    if user && user.authenticate(user_params[:password])
      session[:current_user_id] = user.id
      flash[:message] = "Login Successful!"

      # redirect_to
    else
      flash[:message] = "Username/Password Combination does not exist!"
    end

    redirect_to root_path

  end

  def destroy
    session[:current_user_id] = nil

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
