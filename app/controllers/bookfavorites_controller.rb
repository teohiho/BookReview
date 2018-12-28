class BookfavoritesController < ApplicationController
protect_from_forgery with: :exception
	 include SessionsHelper   
    
    before_action :require_login
		before_action :find_book,only: [ :destroy, :new, :create]
    
    def new 
       @bookfavorite = Bookfavorite.new 
    end

    def create
      @bookfavorite = Bookfavorite.new
      @bookfavorite.book_id = @book.id
      @bookfavorite.user_id = @current_user.id
       if @bookfavorite.save
         flash[:success] = "Thêm sách yêu thích thành công !"
          redirect_to book_path(@book)
       end
   end 
   def show
   end

   def edit
    end
   
   def destroy
     @bookfavorite.destroy
     redirect_to book_path(@book)
    end   
    
    private

	def find_book
			@book = Book.find(params[:book_id])
	end
   	def find_favorite
      @bookfavorite = Bookfavorite.find(params[:id])
    end
    end