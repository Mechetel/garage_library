# frozen_string_literal: true

class Library
  include Storage

  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books   = []
    @orders  = []
    @readers = []
    @authors = []
    load_yml.each { |model| add(model) }
  end

  def to_s
    "Library\n" \
      "Authors:\n\t#{@authors.join("\n\t")}\n" \
      "Books:\n\t#{@books.join("\n\t")}\n" \
      "Readers:\n\t#{@readers.join("\n\t")}\n" \
      "Orders:\n\t#{@orders.join("\n\t")}\n"
  end

  def add(entities)
    entities.flatten.each do |entity|
      case entity
      when Author then @authors << entity
      when Book   then @books   << entity
      when Reader then @readers << entity
      when Order  then @orders  << entity
      end
    end
  end

  alias << add

  def save(file)
    save_yml({ authors: @authors, books: @books, readers: @readers, orders: @orders }, file)
  end

  def best_reader(quantity = 1)
    order_most_popular_attribute(quantity, :reader)
  end

  def bestseller(quantity = 1)
    order_most_popular_attribute(quantity, :book)
  end

  def count_of_top_books_readers(number = 3)
    books = bestseller(number)
    @orders.map { |order| order.reader if books.include?(order.book) }.compact.uniq.size
  end

  private

  def order_most_popular_attribute(quantity, attribute)
    grouped_orders = @orders.group_by(&attribute)
    (grouped_orders.keys.sort_by { |key| -grouped_orders[key].length })[0, quantity]
  end
end
