# frozen_string_literal: true

class Book
  include Validator

  attr_reader :title, :author

  def initialize(title:, author:)
    arg_is_a_class_of(title, String)
    arg_is_a_class_of(author, Author)
    arg_is_positive(title)
    @title = title
    @author = author
  end

  def to_s
    "Book { #{@title} by #{@author.name} }"
  end
end
