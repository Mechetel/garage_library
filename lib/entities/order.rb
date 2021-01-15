class Order
  include Validator

  attr_reader :reader, :book, :date

  def initialize(reader:, book:, date: Date.today)
    arg_is_a_class_of(reader, Reader)
    arg_is_a_class_of(book, Book)
    arg_is_a_class_of(date, Date)
    @reader = reader
    @book = book
    @date = date
  end

  def to_s
    "Order { reader: #{@reader.name}, book: #{@book.title}, date: #{@date.strftime('%d-%m-%Y')} }"
  end
end
