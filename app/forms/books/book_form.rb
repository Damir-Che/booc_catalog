# frozen_string_literal: true

module Books
  class BookForm < ::ApplicationForm
    model :book

    properties :name, :author

    validates :name, :author, presence: true
  end
end
