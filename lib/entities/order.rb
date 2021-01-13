# frozen_string_literal: true

class Order
  attr_reader :reader, :book, :date

  def initialize(reader:, book:, date: Date.today)
    valid_reader?(reader)
    valid_book?(book)
    valid_date?(date)
    @reader = reader
    @book = book
    @date = date
  end

  def to_s
    "Order { reader: #{@reader.name}, book: #{@book.title}, date: #{@date.strftime('%d-%m-%Y')} }"
  end

  private

  def valid_reader?(reader)
    raise IncorrectClassError, Reader unless reader.is_a?(Reader)
  end

  def valid_book?(book)
    raise IncorrectClassError, Book unless book.is_a?(Book)
  end

  def valid_date?(date)
    raise IncorrectClassError, Date unless date.is_a?(Date)
  end
end
