class RequiresController < ApplicationController
protect_from_forgery with: :exception
  include SessionsHelper
    before_action :require_admin, only:[ :index, :show,:edit, :update, :destroy]
    before_action :find_book, only:[:show, :edit, :update, :destroy]
   def index
   	 @books = Require.all
   end

   def new 
      @book = Require.new
      @book.user_id = current_user.id
   end

   def create

      @book = Require.new(require_params)
      @book.user_id = current_user.id
      if @book.save
         flash[:success] = "Thêm mới yêu cầu thành công, admin sẽ cố gắng xử lý yêu cầu của bạn trong thời gian sớm nhất"
         redirect_to root_path
      else
        flash[:danger] = "Thêm mới yêu cầu thất bại"
      end    
   end

   def destroy 
      @book.destroy
      flash[:info] = "xóa yêu cầu thành công"
      redirect_to requires_path 
   end
   
   private
   def require_params
       params.require(:require).permit(:title, :description, :author, :comment, :user_id)   
   end
   def find_book
         @book = Require.find(params[:id])
   end    
end
