class BooksController < ApplicationController
    before_action :set_book, only: [:show, :edit, :update, :destroy]
    
    def index
        @q = Book.ransack(params[:q])
        @books = @q.result(distinct: :true)
    end

    def show
    end

    def new
        @book = Book.new 
        @statuses = Book.statuses.keys.to_a 
    end 

    def create
        @book = Book.new(book_params)
        respond_to do |f|
            if @book.save
                f.html {redirect_to root_path, notice: 'Successfully created'}
            else
                f.html {render root_path, notice: ''}
            end
        end
    end 

    def edit 
        @statuses = Book.statuses.keys.to_a 
    end 

    def update
        respond_to do |f|
            if @book.update(book_params)
                f.html {redirect_to root_path, notice: 'Changed successfully'}
            else 
                f.html {redirect_to edit_book_path}             
            end
        end 
    end 

    def destroy 
        @book.destroy
        respond_to do |f|
            f.html {redirect_to root_path, notice: 'Delete it successfully'}
        end
    end

    private 
    def book_params 
        params.require(:book).permit(:title, :author, :status, :borrowed_at, :returned_at)
    end 

     def set_book 
        @book = Book.find(params[:id])
    end
end
