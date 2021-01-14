# frozen_string_literal: true

require_relative '../modules/storage'

class Library
  include Storage

  FILE_PATH = 'db/data.yaml'

  attr_accessor :books, :orders, :readers, :authors

  def initialize
    @books   = []
    @orders  = []
    @readers = []
    @authors = []
    load_yml(FILE_PATH).each { |model| add(model) }
  end

  def to_s
    "Library\n" \
      "Authors:\n\t#{@authors.join("\n\t")}\n" \
      "Books:\n\t#{@books.join("\n\t")}\n" \
      "Readers:\n\t#{@readers.join("\n\t")}\n" \
      "Orders:\n\t#{@orders.join("\n\t")}\n"
  end

  def add(entities)
    entities.each do |entity|
      case entity
      when Author then @authors << entity unless @authors.include?(entity)
      when Book   then @books   << entity unless @books.include?(entity)
      when Reader then @readers << entity unless @readers.include?(entity)
      when Order  then @orders  << entity if !@orders.include?(entity) && correct_order?(entity)
      end
    end
  end

  alias << add

  def save(file = FILE_PATH)
    save_yml({ authors: @authors, books: @books, readers: @readers, orders: @orders }, file)
  end

  def best_reader(quantity = 1)
    order_most_popular_attribute(quantity, :reader, :name)
  end

  def bestseller(quantity = 1)
    order_most_popular_attribute(quantity, :book, :title)
  end

  def top_books(size = 3)
    @orders
      .group_by(&:book)
      .max_by(size) { |_book, orders| orders.size }
      .map(&:first)
  end

  private

  def order_most_popular_attribute(attribute, group_by_value, quantity = 1)
    @orders.map(&attribute).group_by(&group_by_value).sort_by { |k, v| [-v.size, k] }.to_h.keys.shift(quantity)
  end

  def correct_order?(order)
    @readers.include?(order.reader) && @books.include?(order.book)
  end
end
