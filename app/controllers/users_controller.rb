class UsersController < ApplicationController
 protect_from_forgery with: :exception
 include SessionsHelper
 include BookfavoritesHelper
  
 before_action :require_login, only:[:index, :show, :edit, :update]
 before_action :find_user_by_id, only:[:show, :edit, :update, :destroy]

  def index

  end
   
  def new
      @user = User.new
  end
  
  def show
    check @user
    @book = Book.where(:id => @id).order("created_at DESC") 
  end

  def create
      @user = User.new (user_params)
      if @user.save
      flash[:success] = "Đăng ký thành công"  
      redirect_to login_path
      else
        flash[:danger] = "Đăng ký thất bại !"
        render :new
      end
  end

  def edit
  end  
  
  def update
      if @user.update(user_params)
          redirect_to user_path(@user)
      else
          render 'edit' 
      end
  end    

  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_img)
  end
  def find_user_by_id
      @user = User.find(params[:id])
  end     
end