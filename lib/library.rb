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
    order_most_popular_attribute(:reader).to_h.keys.first(quantity)
  end

  def bestseller(quantity = 1)
    order_most_popular_attribute(:book).to_h.keys.first(quantity)
  end

  def count_of_top_books_readers(number = 3)
    order_most_popular_attribute(:book).first(number).to_h.values.flatten.uniq(&:reader).length
  end

  private

  def order_most_popular_attribute(attribute)
    grouped_orders = @orders.group_by(&attribute)
    grouped_orders.sort_by { |_attribute, order| -order.length }
  end
end
