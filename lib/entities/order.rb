# frozen_string_literal: true

class Order
  include Validator

  attr_reader :reader, :book, :date

  def initialize(reader:, book:, date: Date.today)
    check_class(reader, Reader)
    check_class(book, Book)
    check_class(date, Date)
    @reader = reader
    @book = book
    @date = date
  end
end
