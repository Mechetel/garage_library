# frozen_string_literal: true

class Author
  include Validator

  attr_reader :name, :biography

  def initialize(name:, biography: '')
    check_class(name, biography, String)
    check_not_empty(name)
    @name = name
    @biography = biography
  end
end
