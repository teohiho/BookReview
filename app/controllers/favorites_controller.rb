class FavoritesController < ApplicationController
 protect_from_forgery with: :exception
	 include SessionsHelper   
    
    before_action :require_login
		before_action :find_book

    def new 
       @favorite = Favorite.new 
    end

    def create
      @favorite = Favorite.new
      @favorite.book_id = @book.id
      @favorite.user_id = @current_user.id
       if @favorite.save
         flash[:success] = "Thêm sách yêu thích thành công !"
          redirect_to book_path(@book)
       end
   end 
   def show
   end

   def edit
    end
   
   def destroy
     @favorite.destroy
     redirect_to book_path(@book)
    end   
    
    private

	def find_book
			@book = Book.find(params[:book_id])
	end
   	def find_favorite
      @favorite = Favorite.find(params[:id])
    end
    end