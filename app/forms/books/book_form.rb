# frozen_string_literal: true

module Books
  class BookForm < ::ApplicationForm
    model :book

    properties :name, :author, :date

    validates :name, :author, :date, presence: true
  end
end
