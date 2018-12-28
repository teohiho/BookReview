class SessionsController < ApplicationController
    protect_from_forgery with: :exception
    include SessionsHelper
  def new
  end

  def create
      user = User.find_by name: params[:session][:name].downcase
      if user && user.authenticate(params[:session][:password])
        flash[:success] = "Welcome #{user.name} !"
        log_in user
        redirect_to user
      else
        flash[:danger] = "Invalid email/password combination"
        render :new
      end
  end
  
  def log_out
      session.delete :user_id
  end
  
  def destroy
      log_out
      flash[:success] = "Bạn đã đăng xuất !"
      redirect_to root_path
  end
end