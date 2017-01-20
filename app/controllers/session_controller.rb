class SessionController < ApplicationController

  def create
    user = User.find_by(name: user_params[:name])

    if user && user.authenticate(user_params[:password])
      # session[:current_user_id] = user.id

      token = SecureRandom.urlsafe_base64

      session[:session_token] = token
      user.update(session_token: token)

      flash[:message] = "Login Successful!"
      redirect_to application_angular_path
    else
      flash[:message] = "Username/Password combination does not exist!"
      redirect_to root_path
    end
  end

  def destroy
    log_out!

    redirect_to root_path
  end

  def current_reader
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
