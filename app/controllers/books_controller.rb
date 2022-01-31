class BooksController < ApplicationController
  def index#index.html.erbのページのメソッドの処理
    @books = Book.all
    #一覧表示のbook変数
    @book = Book.new
    #新規投稿のbook変数
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
 
  def create
    @book = Book.new(book_params)
    if @book.save
     flash[:success] = "Your book submission was successfully! Thank you! ;)"
     redirect_to "/books/#{@book.id}"
    else
     @books = Book.all
     render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
     flash[:sucedit] = "successfully edited your book! goodjob! :) "
     redirect_to book_path(@book.id)
    else
     render :edit
    end
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end
  
  private
  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title,:body)
  end
end
