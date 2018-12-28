class BooksController < ApplicationController
    protect_from_forgery with: :exception
    include SessionsHelper
    before_action :require_admin, only:[:new,:create,:edit, :update, :destroy]  
  	before_action :find_book, only:[:show, :edit, :update, :destroy]
    def index
        if params[:category].blank?
      	@book = Book.all.order("created_at DESC")
        else
         @category_id = Category.find_by(name: params[:category]).id
         @book = Book.where(:category_id => @category_id).order("created_at DESC")
        end
        if !params[:search].blank?
        @book = Book.search(params[:search])
        end  
    end 
    
    def new
      	@book = Book.new
        @categories = Category.all.map{|c| [c.name, c.id] }  
    end  		
    
    def show
      if @book.reviews.blank?
      @average_review = 0
    else
      @average_review = @book.reviews.average(:rating).round(2)
    end
    end

    def create
      	@book = Book.new(book_params)
        @book.category_id = params[:category_id]
      	if @book.save
      	   flash[:success] = "Thêm mới sách thành công"
           redirect_to root_path
      	else
      	   flash[:danger] = "Thêm mới sách thất bại" 
      	end      
    end

    def edit
        @categories = Category.all.map{|c| [c.name, c.id] }  
    end
    
    def update
        @book.category_id = params[:category_id]
         if @book.update(book_params)
            redirect_to book_path(@book)
         else
            render 'edit' 
         end
    end         

    def destroy
        @book.destroy
        flash[:success] = "xóa sách thành công" 
        redirect_to root_path
    end
    
    private
    def book_params
      params.require(:book).permit(:title, :description, :author, :category_id, :book_img, :search)
    end
    
    def find_book
        @book = Book.find(params[:id])
    end         	
end
