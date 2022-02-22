require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  context 'POST #index' do
    it 'returns a success responce' do
      get :index
      expect(response).to be_success
    end
  end

  context 'POST #create' do
    it 'create book' do
      book = Book.create(name: 'name', author: 'author', date: 2020)

      expect(book.save).to eq(true)
    end
  end

  context 'POST #destroy' do
    let(:book) { Book.create(name: 'name', author: 'author', date: 2020) }
    it 'deleted book' do
      delete(:destroy, params: { id: book })

      expect(Book.count).to eq(0)
    end
  end
end
