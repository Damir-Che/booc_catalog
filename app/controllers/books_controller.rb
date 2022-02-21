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
    book = Book.new
    result = Books::Save.call(params: books_params, book: book)
    if result.success?
      redirect_to books_path
    else
      render 'new'
    end

    # respond_to do |format|
    #   format.js do
    #     if result.success?
    #       render json: { favorite_id: book.id }, status: :ok
    #     else
    #       render json: { errors: result.errors.messages }, status: :unprocessable_entity
    #     end
    #   end
    # end

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
