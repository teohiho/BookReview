class CommentsController < ApplicationController
	 protect_from_forgery with: :exception
	 include SessionsHelper   
    
    before_action :require_login
		before_action :find_book
    before_action :find_comment,only: [ :destroy]

    def new 
       @comment = Comment.new 
    end

    def create
      @comment = Comment.new(comment_params)
      @comment.book_id = @book.id
      @comment.user_id = @current_user.id
       if @comment.save
        redirect_to book_path(@book)
    end
   end

   def edit
   end
   
   def destroy
     @comment.destroy
     redirect_to book_path(@book)
    end   
    
    private

		def comment_params
			params.require(:comment).permit(:comment)
		end

		def find_book
			@book = Book.find(params[:book_id])
		end
   	def find_comment
      @comment = Comment.find(params[:id])
    end
    end

