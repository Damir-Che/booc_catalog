# frozen_string_literal: true

class BooksController < ApplicationController

  before_action :set_books, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save
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
    redirect_to books_path, success: 'Статья успешно удалена'
  end

  private

  def books_params
    params.require(:book).permit(:name, :author)
  end

  def set_books
    @book = Book.find(params[:id])
  end
end
