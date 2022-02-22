# frozen_string_literal: true

class BooksController < ApplicationController

  before_action :set_books, only: [:edit, :update, :destroy]

  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(distinct: true).paginate(page: params[:page], per_page: 2)
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new
    result = Books::Save.call(params: books_params, book: @book)
    if result.success?
      redirect_to books_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @book.update_attributes(books_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:name, :author, :date)
  end

  def set_books
    @book = Book.find(params[:id])
  end
end
