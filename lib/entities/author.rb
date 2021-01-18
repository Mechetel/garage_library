# frozen_string_literal: true

class Author
  include Validator

  attr_reader :name, :biography

  def initialize(name:, biography: '')
    arg_is_a_class_of(name, biography, String)
    arg_is_not_empty(name)
    @name = name
    @biography = biography
  end

  def to_s
    "Author { #{@name}, #{@biography} }"
  end
end
